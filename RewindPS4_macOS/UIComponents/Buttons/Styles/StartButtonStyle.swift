//
//  StartButtonStyle.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 02.10.2024.
//

import SwiftUI

struct StartButtonStyle: ButtonStyle {
    
    var attemptToStart: Bool
    @State private var isHover = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background { Color.black }
            .border(.accent, width: 1)
            .shadow(color: .accent, radius: 3)
            .scaleEffect(isHover && !attemptToStart ? 1.02 : 1)
            .loadingView(isLoading: attemptToStart)
            .onHover(perform: { hovering in
                isHover = hovering
            })
    }
}
