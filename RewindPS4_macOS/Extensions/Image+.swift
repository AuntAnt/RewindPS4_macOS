//
//  Image+.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 06.09.2024.
//

import SwiftUI

extension Image {
    func defaultModifier() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 210, height: 210)
    }
}
