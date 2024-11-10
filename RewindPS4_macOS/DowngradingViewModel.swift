//
//  DowngradingViewModel.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

@MainActor
final class DowngradingViewModel: ObservableObject {
    
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
    
    private let network: NetworkServiceProtocol
    private let proxy: ProxyServiceProtocol
    private let mapper: Mapper
    
    init(network: NetworkServiceProtocol, proxy: ProxyServiceProtocol, mapper: Mapper) {
        self.network = network
        self.proxy = proxy
        self.mapper = mapper
        
        Task {
            await setLocalIp()
        }
    }
    
    func changeMode() async {
        if currentMode == .mode2 {
            do {
                _ = try await proxy.setMode(currentMode, "")
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
        
        if network.checkIfInputValid(jsonLink: jsonLink) {
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
        } else if currentMode == .mode1, !network.checkIfInputValid(jsonLink: jsonLink) {
            isError = true
            serverStateLabel = LocalizationKeys.ServerInfo.notRunning
            alertMessage = LocalizationKeys.Error.Alert.incorrectJson
        } else if network.checkIfOccupied(port: port) {
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
        }
    }
    
    private func stopProxy() {
        guard isServerRunning else {
            return
        }
        
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
            var result = try await proxy.setMode(currentMode, jsonLink)
            async let cover = network.getGameCoverImage(from: jsonLink)
            
            result["DowngradeVersion"] = network.getDowngradeVersion(from: jsonLink)
            result["ImageCover"] = await cover
            
            gameInfo = mapper.createGameInfo(from: result)
            
            isGameInfoLoading = false
        } catch {
            isError = true
            alertMessage = error.localizedDescription
        }
    }
}
