//
//  CGSize+.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import Foundation

extension CGSize {
    init(square: CGFloat) {
        self.init(width: square, height: square)
    }
}
