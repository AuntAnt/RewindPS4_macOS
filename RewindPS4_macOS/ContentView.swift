//
//  ContentView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var downgradingMode = DowngradingViewModel()
    
    var body: some View {
        VStack {
            HeaderView()
            HStack {
                ModeSelectionView()
                ProxyServerView()
            }
            
            ModeInfoView()
            GuideLinkLabel()
        }
        .padding()
        .preferredColorScheme(.dark)
        .environmentObject(downgradingMode)
    }
}

#Preview {
    ContentView()
}
