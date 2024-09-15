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
                Text("PROXY SERVER")
                    .font(.seiha1)
                    .foregroundStyle(.title)
                
                Spacer()
            }
            
            VStack(alignment: .trailing) {
                // Local IP view
                ServerInfoView(title: "Local IP:", isEditable: .constant(false), value: $viewModel.localIp)
                
                // Port view
                ServerInfoView(
                    title: "Port:",
                    isEditable: $viewModel.isServerRunning.not,
                    isStepperNeeded: true,
                    value: $viewModel.port
                )
            }
            
            Text(viewModel.serverStateLabel.rawValue)
                .font(.title3)
                .foregroundStyle(viewModel.isServerRunning ? .accent : .white)
                .padding()
            
            StartButton(title: $viewModel.buttonLabel) {
                viewModel.toggleServer()
            }
        }
        .alert("Error", isPresented: $viewModel.isError, actions: {}) {
            Text(viewModel.alertMessage ?? "")
        }
        .padding()
        .border(.gray, width: 1)
    }
}

#Preview {
    ProxyServerView()
        .preferredColorScheme(.dark)
}
