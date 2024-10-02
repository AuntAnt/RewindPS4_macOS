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
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .foregroundStyle(.white)
                .font(.title2)
                .frame(width: 400, height: 50)
        })
        .buttonStyle(StartButtonStyle(attemptToStart: $attemptToStart))
    }
}

#Preview {
    StartButton(title: .constant(LocalizationKeys.startProxy.rawValue), attemptToStart: .constant(false)) {}
        .preferredColorScheme(.dark)
        .padding()
}
