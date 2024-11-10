//
//  DeviceViewModel.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 02.11.2024.
//

import SwiftUI
import RewindPS4Proxy

@MainActor
final class DeviceViewModel: ObservableObject {
    
    @Published var latestIp = LocalizationKeys.Device.waiting
    @Published var device = LocalizationKeys.Device.waiting
    
    private var isFetching = false
    private var clientTimer: Timer?
    
    // MARK: - DI
    
    private let logging: LoggingServiceProtocol
    private let proxyService: ProxyServiceProtocol
    
    init(logging: LoggingServiceProtocol, proxyService: ProxyServiceProtocol) {
        self.logging = logging
        self.proxyService = proxyService
    }
    
    // MARK: - Fetching connected client info every 2 seconds when server is running
    
    func fetchConnectedClient() async {
        guard clientTimer == nil else {
            return
        }
        
        clientTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            Task { @MainActor in
                guard !self.isFetching else {
                    return
                }
                self.isFetching = true
                
                let result = try? await self.logging.fetchClientStatus()

                if let result {
                    self.latestIp = result.clientActive ? result.latestClientIP : LocalizationKeys.Device.waiting
                    self.device = result.clientActive
                        ? self.proxyService.detectConnectedDevice(result.latestClientUserAgent)
                        : LocalizationKeys.Device.waiting
                }
                
                self.isFetching = false
            }
        }
    }
    
    func stopFetchingClient() {
        clientTimer?.invalidate()
        clientTimer = nil
        latestIp = LocalizationKeys.Device.waiting
        device = LocalizationKeys.Device.waiting
    }
}
