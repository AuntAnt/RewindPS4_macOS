//
//  View+.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 28.09.2024.
//

import SwiftUI

extension View {
    /// Fill view when loading (for example Start button)
    func loadingView(isLoading: Bool) -> some View {
        modifier(LoadingFillModifier(isLoading: isLoading))
    }
    
    /// Animated stripes when view is selected
    func selectView(isSelect: Bool) -> some View {
        ZStack {
            if isSelect {
//                AnimatedStripedView()
                StripedView()
            }
            
            self
        }
    }
}
