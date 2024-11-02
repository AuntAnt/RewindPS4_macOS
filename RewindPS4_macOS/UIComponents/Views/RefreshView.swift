//
//  RefreshView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 02.11.2024.
//

import SwiftUI

struct RefreshView: View {
    var action: (() -> Void)?
    
    @State private var isHover = false
    @State private var isRotating = false
    @State private var rotationAngle = 0.0
    
    var body: some View {
        Image(systemName: "arrow.2.circlepath")
            .onTapGesture {
                // do not do anything if already in progress
                guard !isRotating else {
                    return
                }
                isRotating = true
                rotationAngle += 360
                
                action?()
                
                Task {
                    try await Task.sleep(for: .seconds(2))
                    isRotating = false
                }
            }
            .rotationEffect(.degrees(rotationAngle))
            .animation(.linear(duration: 2), value: rotationAngle)
            .onHover { isHover = $0 }
            .opacity(isHover || isRotating ? 1 : 0.5)
            .padding(.horizontal, 1.5)
    }
}

#Preview {
    RefreshView(action: {})
}
