//
//  DeviceView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 31.08.2024.
//

import SwiftUI

struct DeviceView: View {
    
    @EnvironmentObject private var mainViewModel: DowngradingViewModel
    @StateObject private var viewModel = DeviceViewModel(logging: Logging(), proxyService: Proxy())
    
    var body: some View {
        ZStack {
            Image(ImageName.deviceBackground)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 100)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(LocalizationKeys.Device.connected)
                    .font(.seiha1)
                    .foregroundStyle(.title)
                
                HStack(spacing: 50) {
                    HStack(spacing: 5) {
                        Text("IP: ")
                        Text(viewModel.latestIp)
                    }
                    HStack(spacing: 5) {
                        Text("TYPE: ")
                        Text(viewModel.device)
                    }
                }
                .font(.seiha3)
                .foregroundStyle(.accent)
            }
        }
        .onReceive(mainViewModel.$isServerRunning, perform: { isRunning in
            if isRunning {
                Task {
                    await viewModel.fetchConnectedClient()
                }
            } else {
                viewModel.stopFetchingClient()
            }
        })
        .frame(width: 400, height: 100)
    }
}

#Preview {
    DeviceView()
        .preferredColorScheme(.dark)
}
