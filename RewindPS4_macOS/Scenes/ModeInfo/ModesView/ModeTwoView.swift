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
                Text(LocalizationKeys.Mode.Mode2.introduce)
                    .font(.seiha1)
                    .foregroundStyle(.title)
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(LocalizationKeys.Mode.Mode2.description_1)
                Text(LocalizationKeys.Mode.Mode2.description_2)
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
