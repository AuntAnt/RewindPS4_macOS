//
//  Collection+.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 26.09.2024.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
