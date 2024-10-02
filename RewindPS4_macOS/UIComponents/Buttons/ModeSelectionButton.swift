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
    let isEnable: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
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
            .frame(width: 480, height: 118)
        })
        .buttonStyle(ModeSelectionButtonStyle(isSelected: isSelected, isEnable: isEnable))
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
