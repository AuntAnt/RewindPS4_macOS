//
//  Network.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 07.09.2024.
//

import RewindPS4Proxy

protocol NetworkServiceProtocol {
    func fetchLocalIp() async -> String
    func checkIfInputValid(jsonLink url: String) -> Bool
    func checkIfOccupied(port: String) -> Bool
    
    func getDowngradeVersion(from url: String) -> String
    func getGameCoverImage(from url: String) async -> String?
}

final class Network: NetworkServiceProtocol {
    
    private let networkService = NetworkServiceImpl.instance
    
    func fetchLocalIp() async -> String {
        return await networkService.getLocalIP()
    }
    
    func checkIfInputValid(jsonLink url: String) -> Bool {
        return networkService.validateJSON(url: url)
    }
    
    func checkIfOccupied(port: String) -> Bool {
        guard let port = Int(port) else {
            return true
        }
        return networkService.validatePort(port)
    }
    
    func getDowngradeVersion(from url: String) -> String {
        return networkService.getGameVersion(from: url)
    }
    
    func getGameCoverImage(from url: String) async -> String? {
        return try? await networkService.fetchGameImageCover(from: url)
    }
}
