//
//  ContentView.swift
//  RewindPS4_MacOS
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
            HStack {
                Spacer()
                Link("User Guide", destination: URL(string: "https://foggy-bath-a54.notion.site/RewindPS4-Guide1-0-ENGLISH-28164b6f656d445f823a0f7c7d9ae890?pvs=4")!)
                    .foregroundStyle(.accent)
                    .underline(color: .accent)
            }
        }
        .padding()
        .preferredColorScheme(.dark)
        .environmentObject(downgradingMode)
    }
}

#Preview {
    ContentView()
}
