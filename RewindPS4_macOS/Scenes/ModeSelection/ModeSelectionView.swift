//
//  ModeSelectionView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ModeSelectionView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    
    var body: some View {
        VStack {
            ModeSelectionButton(
                title: "MODE-1",
                description: "Enter the patch link to download the specified version of the PS4 game (applicable for PS4/PS5 consoles)",
                isSelected: viewModel.currentMode == .mode1,
                isEnable: !viewModel.isServerRunning || viewModel.isServerRunning && viewModel.currentMode == .mode1,
                action: { viewModel.currentMode = .mode1 }
            )
            
            ModeSelectionButton(
                title: "MODE-2",
                description: "Block the update server to prevent game updates, download version 1.0 of the PS4 game (only applicable to PS4 consoles)",
                isSelected: viewModel.currentMode == .mode2,
                isEnable: !viewModel.isServerRunning || viewModel.isServerRunning && viewModel.currentMode == .mode2,
                action: { viewModel.currentMode = .mode2 }
            )
        }
    }
}

#Preview {
    ModeSelectionView()
}
