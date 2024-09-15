//
//  ModeInfoView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ModeInfoView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    
    var body: some View {
        VStack {
            switch viewModel.currentMode {
            case .mode0:
                NoModeView()
            case .mode1:
                ModeOneView()
            case .mode2:
                ModeTwoView()
            }
        }
        .padding()
        .border(.gray)
        .padding()
    }
}

#Preview {
    ModeInfoView()
        .environmentObject(DowngradingViewModel())
        .preferredColorScheme(.dark)
}
