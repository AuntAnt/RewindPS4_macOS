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
                title: LocalizationKeys.mode1.rawValue,
                description: LocalizationKeys.mode1Desc.rawValue,
                isSelected: viewModel.currentMode == .mode1,
                isEnable: !viewModel.isServerRunning || viewModel.isServerRunning && viewModel.currentMode == .mode1,
                action: { viewModel.currentMode = .mode1 }
            )
            
            ModeSelectionButton(
                title: LocalizationKeys.mode2.rawValue,
                description: LocalizationKeys.mode2Desc.rawValue,
                isSelected: viewModel.currentMode == .mode2,
                isEnable: !viewModel.isServerRunning || viewModel.isServerRunning && viewModel.currentMode == .mode2,
                action: { 
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
