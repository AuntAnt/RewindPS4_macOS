//
//  NoModeView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

struct NoModeView: View {
    var body: some View {
        VStack {
            Text("Please select any mode")
                .font(.title2)
                .foregroundStyle(.infoText)
            
            Image(ImageName.modeSelect)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    NoModeView()
        .preferredColorScheme(.dark)
        .padding()
}
