//
//  ModeSelectionButton.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct ModeSelectionButton: View {
    
    let title: LocalizedStringKey
    let description: LocalizedStringKey
    let isSelected: Bool
    var isEnable: Bool
    var action: () -> Void
    
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
    
    var body: some View {
        Rectangle()
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        Text(title)
                            .font(.seiha1)
                            .foregroundStyle(.title)
                        Spacer()
                    }
                    
                    Text(description)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.descriptionText)
                }
                .padding(.horizontal, 8)
            }
            .selectView(isSelect: isSelected)
            .foregroundStyle(.black.opacity(0.4))
            .onTapGesture {
                if isEnable {                
                    action()
                }
            }
            .scaleEffect(isHover && isEnable ? 1.02 : 1)
            .onHover { hovering in
                isHover = hovering
            }
            .opacity(opacity)
    }
}

#Preview {
    ModeSelectionButton(
        title: "MODE-1",
        description: "The long button description that describe what the selected mode do, which consoles supported and other things",
        isSelected: false, 
        isEnable: true,
        action: {}
    )
}
