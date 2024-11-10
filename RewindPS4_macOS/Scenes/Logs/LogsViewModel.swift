//
//  LogsViewModel.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 02.11.2024.
//

import SwiftUI
import RewindPS4Proxy

@MainActor
final class LogsViewModel: ObservableObject {
    
    @Published var logs: [String] = []
    @Published var autoscroll = true
    @Published var logFiltering = false
    
    private var isFetching = false
    private var logsTimer: Timer?
    
    // MARK: - DI
    
    private let logging: LoggingServiceProtocol
    
    init(logging: LoggingServiceProtocol) {
        self.logging = logging
    }
    
    // MARK: - Fetching logs every second
    
    func fetchLogs() async {
        guard logsTimer == nil else {
            return
        }
        
        logsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            Task { @MainActor in
                do {
                    guard !self.isFetching else {
                        return
                    }
                    self.isFetching = true
                    
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
                    
                    self.isFetching = false
                    self.logs = result
                } catch {
                    self.logs = [error.localizedDescription]
                }
            }
        }
    }
}
