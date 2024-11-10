//
//  Proxy.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 08.09.2024.
//

import RewindPS4Proxy

protocol ProxyServiceProtocol {
    func setMode(_ mode: Mode, _ url: String) async throws -> [String: Any]
    func startProxy(on port: String) async throws
    func stopProxy()
    func pushSelectedModeLog(_ mode: Mode)
    func detectConnectedDevice(_ userAgent: String) -> String
}

final class Proxy: ProxyServiceProtocol {
    
    private let service = ProxyServiceImpl.instance
    
    func setMode(_ mode: Mode, _ url: String) async throws -> [String : Any] {
        return try await service.setMode(mode.rawValue, url)
    }
    
    func startProxy(on port: String) async throws {
        try await service.startProxy(port)
    }
    
    func stopProxy() {
        service.stopProxy()
    }
    
    func pushSelectedModeLog(_ mode: Mode) {
        service.pushModeSelectionLog(mode.rawValue)
    }
    
    func detectConnectedDevice(_ userAgent: String) -> String {
        return service.detectConnectedClient(userAgent)
    }
}
