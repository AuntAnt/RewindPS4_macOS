//
//  DismissButton.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 22.09.2024.
//

import SwiftUI

struct DismissButton: View {
    let action: () -> Void
    
    var body: some View {
        Image(systemName: "xmark")
            .foregroundStyle(.white)
            .frame(width: 30, height: 30)
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    DismissButton(action: { print("Dismissed") })
        .preferredColorScheme(.dark)
        .padding()
}
