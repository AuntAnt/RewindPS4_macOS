//
//  LoggingService.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 09.09.2024.
//

import RewindPS4Proxy

final class LoggingService {
 
    private let service: LoggingService
    
    private func fetchData<T: Decodable>(from url: URL, type: T.Type) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(type, from: data)
        
        return result
    }
}
