//
//  LoadingFillModifier.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 28.09.2024.
//

import SwiftUI

struct LoadingFillModifier: ViewModifier {
    
    @Binding var isLoading: Bool
    @State private var fillProgress: CGFloat = 0.0
    
    func body(content: Content) -> some View {
        content.overlay(alignment: .leading) {
            if isLoading {
                GeometryReader { geometry in
                    Rectangle()
                        .fill(.accent)
                        .frame(width: fillProgress * geometry.size.width, height: geometry.size.height)
                        .animation(isLoading ? .easeInOut(duration: 2.0) : .none, value: fillProgress)
                        .onAppear {
                            startLoading()
                        }
                }
            }
        }
    }
    
    private func startLoading() {
        withAnimation {
            fillProgress = 1.0
        }
        
        Task {
            try? await Task.sleep(for: .seconds(2))
            withAnimation(.none) {
                fillProgress = 0.0
            }
        }
    }
}
