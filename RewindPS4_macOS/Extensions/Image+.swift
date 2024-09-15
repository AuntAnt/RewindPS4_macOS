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
            .frame(minWidth: 180, idealWidth: 180, maxWidth: 210, minHeight: 180, idealHeight: 180, maxHeight: 400)
    }
}
