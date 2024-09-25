//
//  ContentView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DowngradingViewModel()
    @StateObject private var faqViewModel = FAQViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            // MARK: - Header + Connected device
            HeaderView()
            
            // MARK: - Select mode + proxy server
            HStack(spacing: 10) {
                ModeSelectionView()
                ProxyServerView()
            }
            .frame(width: 970, height: 240)
            
            // MARK: - Mode description + logs
            HStack(spacing: 10) {
                ModeInfoView()
                    .frame(height: 382)
                    .border(Color.gray)
                LogsView()
            }
            .frame(width: 970, height: 390)
            
            // MARK: - FAQ + user guide
            HStack() {
                Spacer()
                Text(LocalizationKeys.errorCode.rawValue)
                    .foregroundStyle(.accent)
                    .onTapGesture {
                        faqViewModel.isShowingFAQ = true
                    }
                
                GuideLinkLabel()
            }
            .frame(height: 20)
        }
        .padding()
        .preferredColorScheme(.dark)
        .background(content: {
            Color.background
        })
        .blur(radius: faqViewModel.isShowingFAQ ? 5 : 0)
        .environmentObject(viewModel)
        .sheet(isPresented: $faqViewModel.isShowingFAQ) {
            // MARK: - FAQ screen
            FAQView(viewModel: faqViewModel)
                .frame(width: 800, height: 600, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
