//
//  Logging.swift
//  RewindPS4_MacOS
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
    
    private func convert<T: Decodable>(data: Data, to type: T.Type) throws -> T {
        let result = try JSONDecoder().decode(type, from: data)
        
        return result
    }
}
