//
//  DeviceView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 31.08.2024.
//

import SwiftUI

struct DeviceView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    
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
        .frame(width: 400, height: 100)
    }
}

#Preview {
    DeviceView()
        .preferredColorScheme(.dark)
        .environmentObject(DowngradingViewModel())
}
