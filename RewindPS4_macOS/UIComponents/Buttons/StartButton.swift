//
//  StartButton.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct StartButton: View {
    
    @Binding var title: LocalizedStringKey
    @Binding var attemptToStart: Bool
    var action: () -> Void
    
    @State private var isHover = false
    
    var body: some View {
        Rectangle()
            .frame(width: 400, height: 50)
            .overlay {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.title2)
            }
            .foregroundStyle(.black)
            .border(.accent, width: 1)
            .shadow(color: .accent, radius: 3)
            .scaleEffect(isHover && !attemptToStart ? 1.05 : 1)
            .onHover(perform: { hovering in
                isHover = hovering
            })
            .loadingView(isLoading: $attemptToStart)
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    StartButton(title: .constant(LocalizationKeys.startProxy.rawValue), attemptToStart: .constant(false)) {}
        .preferredColorScheme(.dark)
        .padding()
}
