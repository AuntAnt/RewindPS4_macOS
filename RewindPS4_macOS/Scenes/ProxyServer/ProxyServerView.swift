//
//  ProxyServerView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ProxyServerView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(LocalizationKeys.ServerInfo.proxyServer)
                    .font(.seiha1)
                    .foregroundStyle(.title)
                
                Spacer()
            }
            
            VStack(alignment: .trailing) {
                // Local IP view
                ServerInfoView(
                    title: LocalizationKeys.ServerInfo.localIP,
                    value: $viewModel.localIp,
                    color: viewModel.isServerRunning ? .accent : .infoText
                )
                
                // Port view
                ServerInfoView(
                    title: LocalizationKeys.ServerInfo.port,
                    isEditable: !viewModel.isServerRunning,
                    isStepperNeeded: true,
                    value: $viewModel.port,
                    color: viewModel.isServerRunning ? .accent : .infoText
                )
            }
            
            Text(viewModel.serverStateLabel)
                .font(.title3)
                .foregroundStyle(viewModel.isServerRunning ? .accent : .white)
                .padding()
            
            StartButton(
                title: $viewModel.buttonLabel,
                attemptToStart: viewModel.attemptToStart,
                isActive: viewModel.isServerRunning
            ) {
                viewModel.toggleServer()
            }
        }
        .alert(LocalizationKeys.Error.error, isPresented: $viewModel.isError, actions: {}) {
            Text(viewModel.alertMessage ?? "")
        }
        .padding()
        .border(.gray, width: 1)
    }
}

#Preview {
    ProxyServerView()
        .environmentObject(DowngradingViewModel())
        .preferredColorScheme(.dark)
}
