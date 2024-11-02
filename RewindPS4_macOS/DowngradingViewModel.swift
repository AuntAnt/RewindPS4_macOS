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
    
    // MARK: - Connected client
    
    @Published var latestIp = LocalizationKeys.Device.waiting
    @Published var device = LocalizationKeys.Device.waiting
    private var clientTimer: Timer?
    
    // MARK: - Logs
    
    @Published var logs: [String] = []
    @Published var autoscroll = true
    @Published var logFiltering = false
    private var logsTimer: Timer?
    
    // MARK: - Mode selection
    
    @Published var currentMode: Mode = .mode0 {
        didSet {
            if currentMode != .mode1 {
                jsonLink = ""
            }
            
            if !isServerRunning {            
                proxy.pushSelectedModeLog(currentMode)
            }
        }
    }
    
    // MARK: - Mode info
    
    @Published var jsonLink = ""
    @Published var inputMessage = LocalizationKeys.Mode.Mode1.enterJSONLink
    @Published var gameInfo: GameInfo?
    @Published var isGameInfoLoading = false
     
    // MARK: - Server
    
    @Published var localIp = ""
    @Published var port = "8080"
    @Published var isError = false
    @Published var buttonLabel = LocalizationKeys.ServerInfo.Button.start
    @Published var serverStateLabel = LocalizationKeys.ServerInfo.notRunning
    @Published var alertMessage: String?
    @Published var isServerRunning = false
    @Published var attemptToStart = false
    
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
        
        Task {
            await fetchLogs()
        }
    }
    
    func changeMode() async {
        if currentMode == .mode2 {
            do {
                let _ = try await proxy.setMode(currentMode, "")
            } catch {
                isError = true
                alertMessage = error.localizedDescription
            }
        }
    }
    
    func validateInput() async {
        guard !jsonLink.isEmpty else {
            inputMessage = LocalizationKeys.Mode.Mode1.enterJSONLink
            gameInfo = nil
            return
        }
        
        if network.isValidInput(jsonLink: jsonLink) {
            inputMessage = LocalizationKeys.Mode.Mode1.jsonCorrect
            await setMode()
        } else {
            inputMessage = LocalizationKeys.Mode.Mode1.jsonError
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
    
    func setLocalIp() async {
        localIp = await network.fetchLocalIp()
    }
    
    private func startProxy() {
        if currentMode == .mode0 {
            isError = true
            serverStateLabel = LocalizationKeys.ServerInfo.notRunning
            alertMessage = LocalizationKeys.Mode.pleaseSelectAnyMode
        } else if currentMode == .mode1, !network.isValidInput(jsonLink: jsonLink) {
            isError = true
            serverStateLabel = LocalizationKeys.ServerInfo.notRunning
            alertMessage = LocalizationKeys.Error.Alert.incorrectJson
        } else if network.isOccupied(port: port) {
            isError = true
            serverStateLabel = LocalizationKeys.ServerInfo.notRunning
            alertMessage = LocalizationKeys.Error.Alert.portUsed
        } else {
            attemptToStart = true
            Task {
                do {
                    try await proxy.startProxy(on: port)
                    isServerRunning = true
                    buttonLabel = LocalizationKeys.ServerInfo.Button.stop
                    serverStateLabel = LocalizationKeys.ServerInfo.running
                } catch {
                    isError = true
                    alertMessage = error.localizedDescription
                    
                    isServerRunning = false
                    buttonLabel = LocalizationKeys.ServerInfo.Button.start
                    serverStateLabel = LocalizationKeys.ServerInfo.notRunning
                }
                
                attemptToStart = false
            }
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
        buttonLabel = LocalizationKeys.ServerInfo.Button.start
        serverStateLabel = LocalizationKeys.ServerInfo.notRunning
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
            alertMessage = error.localizedDescription
        }
    }
    
    // MARK: - Fetching logs every second
    
    private func fetchLogs() async {
        guard logsTimer == nil else {
            return
        }
        
        logsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            Task { @MainActor in
                do {
                    let data = try await self.logging.fetchLogs()
                    
                    var result: [String] = []
                    
                    data.logs.forEach { log in
                        if !log.contains("***") {
                            if !self.logFiltering
                                || (log.contains("INFO")
                                    || log.contains(".json")
                                    || log.contains(".pkj")
                                    || log.contains(".png")
                                ) {
                                result.append(log)
                            }
                        }
                    }
                    
                    self.logs = result
                } catch {
                    self.logs = [error.localizedDescription]
                }
            }
        }
    }
    
    // MARK: - Fetching connected client info every 2 seconds when server is running
    
    private func fetchConnectedClient() async {
        guard clientTimer == nil else {
            return
        }
        
        clientTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            Task { @MainActor in
                let result = try? await self.logging.fetchClientStatus()
                
                if let result {
                    self.latestIp = result.clientActive ? result.latestClientIP : LocalizationKeys.Device.waiting
                    self.device = result.clientActive
                        ? self.proxy.detectConnectedDevice(result.latestClientUserAgent)
                        : LocalizationKeys.Device.waiting
                }
            }
        }
    }
    
    private func stopFetchingLogs() {
        clientTimer?.invalidate()
        clientTimer = nil
        latestIp = LocalizationKeys.Device.waiting
        device = LocalizationKeys.Device.waiting
    }
}
