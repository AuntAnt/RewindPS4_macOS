//
//  ModeTwoView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

struct ModeTwoView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(LocalizationKeys.introduce.rawValue)
                    .font(.seiha1)
                    .foregroundStyle(.title)
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(LocalizationKeys.m2desc1.rawValue)
                Text(LocalizationKeys.m2desc2.rawValue)
            }
            .foregroundStyle(.descriptionText)
            
            Image(ImageName.blockUpdates)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .onAppear {
            viewModel.gameInfo = nil
        }
    }
}

#Preview {
    ModeTwoView()
        .preferredColorScheme(.dark)
        .padding()
}
