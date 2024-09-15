//
//  ModeTwoView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

struct ModeTwoView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("INRODUCE")
                    .font(.seiha1)
                    .foregroundStyle(.title)
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text("1.Block the update server to bypass patch detection and download only the version 1.0 of the game")
                Text("2.Due to certain reasons, this is only applicable for PS4. Using it on PS5 may result in downloading the latest version of an error code NW-102650-4")
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
