//
//  GameInfo.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 06.09.2024.
//

import Foundation

struct GameInfo {
    let id: String
    let title: String
    let region: String
    let lastVersion: String
    let downgradeVersion: String
    var imageCover: String?
    
    var cusa: String {
        return "\(id) - \(region)"
    }
}
