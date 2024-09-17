//
//  DowngradingViewModel.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI
import RewindPS4Proxy

@MainActor
final class DowngradingViewModel: ObservableObject {
    
    // MARK: - Connected client and logs
    
    @Published var latestIp = "Waiting"
    @Published var device = "Waiting"
    
    private var timer: Timer?
    
    // MARK: - Mode selection
    
    @Published var currentMode: Mode = .mode0 {
        didSet {
            if currentMode != .mode1 {
                jsonLink = ""
            }
        }
    }
    
    // MARK: - Mode info
    
    @Published var jsonLink = ""
    @Published var inputMessage = LocalizationKeys.enterJSONLink.rawValue
    @Published var gameInfo: GameInfo?
    @Published var isGameInfoLoading = false
     
    // MARK: - Server
    
    @Published var localIp = ""
    @Published var port = "8080"
    @Published var isError = false
    @Published var buttonLabel = LocalizationKeys.startProxy.rawValue
    @Published var serverStateLabel = LocalizationKeys.notRunning.rawValue
    @Published var alertMessage: LocalizedStringKey?
    @Published var isServerRunning = false
    
    // MARK: - Dependency
    
    let network: Network
    let proxy: Proxy
    let logging: Logging
    
    init() {
        network = Network(networkService: NetworkServiceImpl.instance)
        proxy = Proxy(service: ProxyServiceImpl.instance, network: NetworkServiceImpl.instance, mapper: Mapper())
        logging = Logging(service: LoggingServiceImpl.instance)
        
        Task {
            await setLocalIp()
        }
    }
    
    func validateInput() async {
        guard !jsonLink.isEmpty else {
            inputMessage = LocalizationKeys.enterJSONLink.rawValue
            gameInfo = nil
            return
        }
        
        if network.isValidInput(jsonLink: jsonLink) {
            inputMessage = LocalizationKeys.jsonCorrect.rawValue
            await setMode()
        } else {
            inputMessage = LocalizationKeys.jsonError.rawValue
            gameInfo = nil
        }
    }
    
    func toggleServer() {
        if !isServerRunning {
            startProxy()
        } else {
            stopProxy()
        }
    }
    
    private func setLocalIp() async {
        localIp = await network.fetchLocalIp()
    }
    
    private func startProxy() {
        if currentMode == .mode0 {
            isError = true
            serverStateLabel = LocalizationKeys.notRunning.rawValue
            alertMessage = LocalizationKeys.pleaseSelectAnyMode.rawValue
        } else if currentMode == .mode1, !network.isValidInput(jsonLink: jsonLink) {
            isError = true
            serverStateLabel = LocalizationKeys.notRunning.rawValue
            alertMessage = LocalizationKeys.alertIncorrectJson.rawValue
        } else if network.isOccupied(port: port) {
            isError = true
            serverStateLabel = LocalizationKeys.notRunning.rawValue
            alertMessage = LocalizationKeys.portUsed.rawValue
        } else {
            proxy.startProxy(on: port)
            isServerRunning = true
            buttonLabel = LocalizationKeys.stopProxy.rawValue
            serverStateLabel = LocalizationKeys.running.rawValue
            Task {
                await fetchConnectedClient()
            }
        }
    }
    
    private func stopProxy() {
        guard isServerRunning else {
            return
        }
        
        stopFetchingLogs()
        proxy.stopProxy()
        isServerRunning = false
        buttonLabel = LocalizationKeys.startProxy.rawValue
        serverStateLabel = LocalizationKeys.notRunning.rawValue
    }
    
    private func setMode() async {
        guard !isServerRunning else {
            return
        }
        
        isGameInfoLoading = true
        
        do {
            gameInfo = try await proxy.setMode(currentMode, jsonLink)
            isGameInfoLoading = false
        } catch {
            isError = true
            alertMessage = LocalizedStringKey(error.localizedDescription) 
        }
    }
    
    private func fetchConnectedClient() async {
        guard timer == nil else {
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            Task { @MainActor in
                let result = try? await self.logging.fetchClientStatus()
                
                if let result {
                    self.latestIp = result.clientActive ? result.latestClientIP : "Waiting"
                    self.device = result.clientActive
                        ? self.proxy.detectConnectedDevice(result.latestClientUserAgent)
                        : "Waiting"
                }
            }
        }
    }
    
    private func stopFetchingLogs() {
        timer?.invalidate()
        timer = nil
        latestIp = "Waiting"
        device = "Waiting"
    }
}
