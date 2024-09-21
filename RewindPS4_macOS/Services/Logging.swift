//
//  Logging.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 09.09.2024.
//

import Foundation
import RewindPS4Proxy

final class Logging {
 
    private let service: LoggingService
    
    init(service: LoggingService) {
        self.service = service
    }
    
    func fetchClientStatus() async throws -> ClientStatus {
        let response = try await service.fetchClientStatus()
        return try convert(data: response, to: ClientStatus.self)
    }
    
    func fetchLogs() async throws -> Logs {
        let response = try await service.fetchLogs()
        return try convert(data: response, to: Logs.self)
    }
    
    private func convert<T: Decodable>(data: Data, to type: T.Type) throws -> T {
        let result = try JSONDecoder().decode(type, from: data)
        
        return result
    }
}
