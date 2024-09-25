//
//  StartButton.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct StartButton: View {
    
    @Binding var title: LocalizedStringKey
    var action: () -> Void
    
    @State private var isHover = false
    
    var body: some View {
        Rectangle()
            .frame(minWidth: 200, idealWidth: 400, maxWidth: 400, minHeight: 50, idealHeight: 50, maxHeight: 50)
            .overlay {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.title2)
            }
            .foregroundStyle(.black)
            .border(.accent, width: 1)
            .onTapGesture {
                action()
            }
            .shadow(color: .accent, radius: 3)
            .animation(.bouncy, value: isHover)
            .scaleEffect(isHover ? 1.05 : 1)
            .onHover(perform: { hovering in
                isHover = hovering
            })
    }
}

#Preview {
    StartButton(title: .constant(LocalizationKeys.startProxy.rawValue)) {}
        .preferredColorScheme(.dark)
        .padding()
}
