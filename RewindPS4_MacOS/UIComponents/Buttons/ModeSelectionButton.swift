//
//  ModeSelectionButton.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct ModeSelectionButton: View {
    
    let title: String
    let description: String
    let isSelected: Bool
    var isEnable: Bool
    var action: () -> Void
    
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
            .foregroundStyle(.black.opacity(0.4))
            .frame(minWidth: 400, idealWidth: 400, minHeight: 60, idealHeight: 60, maxHeight: 120)
            .border(.gray, width: isSelected ? 2 : 0.5)
            .scaleEffect(isSelected ? CGSize(square: 1.01) : CGSize(square: 1))
            .onTapGesture {
                if isEnable {                
                    action()
                }
            }
            .opacity(isEnable ? 1 : 0.3)
    }
}

#Preview {
    ModeSelectionButton(
        title: "MODE 1",
        description: "The long button description that describe what the selected mode do, which consoles supported and other things",
        isSelected: false, 
        isEnable: true,
        action: {}
    )
}
