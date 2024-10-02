//
//  ModeSelectionButtonStyle.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 02.10.2024.
//

import SwiftUI

struct ModeSelectionButtonStyle: ButtonStyle {
    
    let isSelected: Bool
    let isEnable: Bool
    
    @State private var isHover = false
    
    private var opacity: Double {
        if isEnable && !isSelected {
            return 0.8
        } else if isSelected {
            return 1
        } else {
            return 0.3
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background { Color.black.opacity(0.4) }
            .selectView(isSelect: isSelected)
            .opacity(opacity)
            .scaleEffect(isHover && isEnable ? 1.02 : 1)
            .onHover { hovering in
                isHover = hovering
            }
    }
}
