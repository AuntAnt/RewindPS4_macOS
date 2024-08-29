//
//  ModeSelectionView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ModeSelectionView: View {
    
    @State private var mode: Mode?
    
    var body: some View {
        VStack {
            ModeSelectionButton(
                title: "MODE 1",
                description: "Enter the patch link to download the specified version of the PS4 game (applicable for PS4/PS5 consoles)",
                isSelected: mode == .mode1,
                action: { mode = .mode1 }
            )
            
            ModeSelectionButton(
                title: "MODE 2",
                description: "Block the update server to prevent game updates, download version 1.0 of the PS4 game (only applicable to PS4 consoles)",
                isSelected: mode == .mode2,
                action: { mode = .mode2 }
            )
        }
    }
}

#Preview {
    ModeSelectionView()
}
