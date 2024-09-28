//
//  View+.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 28.09.2024.
//

import SwiftUI

extension View {
    /// Fill view when loading (for example Start button)
    func loadingView(isLoading: Binding<Bool>) -> some View {
        modifier(LoadingFillModifier(isLoading: isLoading))
    }
}
