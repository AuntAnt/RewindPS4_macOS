//
//  Network.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 07.09.2024.
//

import RewindPS4Proxy

final class Network {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchLocalIp() async -> String {
        return await networkService.getLocalIP()
    }
    
    func isValidInput(jsonLink url: String) -> Bool {
        return networkService.validateJSON(url: url)
    }
    
    func isOccupied(port: String) -> Bool {
        guard let port = Int(port) else {
            return true
        }
        return networkService.validatePort(port)
    }
}
