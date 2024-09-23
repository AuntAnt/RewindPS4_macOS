//
//  Proxy.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 08.09.2024.
//

import RewindPS4Proxy

final class Proxy {
    
    private let service: ProxyService
    private let network: NetworkService
    private let mapper: Mapper
    
    init(service: ProxyService, network: NetworkService, mapper: Mapper) {
        self.service = service
        self.network = network
        self.mapper = mapper
    }
    
    func setMode(_ mode: Mode, _ url: String) async throws -> GameInfo? {
        async let setMode = service.setMode(mode.rawValue, url)
        async let imageCover = getGameCoverImage(from: url)
        
        let cover = await imageCover
        let response = try await setMode
        let downgradeVersion = getDowngradeVersion(from: url)
        
        return mapper.createGameInfo(from: response, downgradeVersion, cover)
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
    
    private func getDowngradeVersion(from url: String) -> String {
        return network.getGameVersion(from: url)
    }
    
    private func getGameCoverImage(from url: String) async -> String? {
        return try? await network.fetchGameImageCover(from: url)
    }
}
