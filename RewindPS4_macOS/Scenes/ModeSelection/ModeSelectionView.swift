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
        VStack(spacing: 8) {
            ModeSelectionButton(
                title: LocalizationKeys.ModeSelection.mode1,
                description: LocalizationKeys.ModeSelection.Description.mode1,
                isSelected: viewModel.currentMode == .mode1,
                isEnable: !viewModel.isServerRunning || viewModel.isServerRunning && viewModel.currentMode == .mode1,
                action: {
                    guard !viewModel.isServerRunning else {
                        return
                    }
                    
                    viewModel.currentMode = .mode1
                }
            )
            
            ModeSelectionButton(
                title: LocalizationKeys.ModeSelection.mode2,
                description: LocalizationKeys.ModeSelection.Description.mode2,
                isSelected: viewModel.currentMode == .mode2,
                isEnable: !viewModel.isServerRunning || viewModel.isServerRunning && viewModel.currentMode == .mode2,
                action: {
                    guard !viewModel.isServerRunning else {
                        return
                    }
                    
                    viewModel.currentMode = .mode2
                    Task {
                        await viewModel.changeMode()
                    }
                }
            )
        }
    }
}

#Preview {
    ModeSelectionView()
}
