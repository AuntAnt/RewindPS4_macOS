//
//  LogsView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 19.09.2024.
//

import SwiftUI

struct LogsView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    
    var body: some View {
        VStack {
            VStack(spacing: 2) {
                HStack {
                    Text(LocalizationKeys.Logs.log)
                        .font(.seiha1)
                        .foregroundStyle(.infoText)
                    
                    Spacer()
                    
                    Toggle(isOn: $viewModel.autoscroll, label: {
                        Text(LocalizationKeys.Logs.autoScroll)
                            .foregroundStyle(.white)
                    })
                    
                    Toggle(isOn: $viewModel.logFiltering, label: {
                        Text(LocalizationKeys.Logs.logFiltering)
                            .foregroundStyle(.white)
                    })
                }
                
                Color.gray.frame(height: 1)
            }
            
            LogsScrollView(logs: $viewModel.logs, autoscroll: viewModel.autoscroll)
        }
        .padding()
        .border(.gray, width: 1)
    }
}

#Preview {
    LogsView()
        .environmentObject(DowngradingViewModel())
        .preferredColorScheme(.dark)
}
