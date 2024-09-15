//
//  Logs.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 09.09.2024.
//

import Foundation

struct ClientStatus: Decodable {
    let clientActive: Bool
    let latestClientIP: String
    let latestClientUserAgent: String
}

struct Logs: Decodable {
    let firstClientIP: String
    let firstClientUserAgent: String
    let logs: [String]
}
