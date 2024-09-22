//
//  ContentView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DowngradingViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView()
            
            HStack(spacing: 10) {
                ModeSelectionView()
                ProxyServerView()
            }
            .frame(width: 970, height: 240)
            
            HStack(spacing: 10) {
                ModeInfoView()
                    .frame(height: 382)
                    .border(Color.gray)
                LogsView()
            }
            .frame(width: 970, height: 390)
            
            GuideLinkLabel()
                .frame(height: 20)
        }
        .padding()
        .preferredColorScheme(.dark)
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
