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
                .frame(minWidth: 400, idealWidth: 400, maxWidth: 400, minHeight: 100, idealHeight: 100, maxHeight: 100)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Connected Device")
                    .font(.seiha1)
                    .foregroundStyle(.title)
                
                HStack(spacing: 50) {
                    Text("IP: \(viewModel.latestIp)")
                    Text("TYPE: \(viewModel.device)")
                }
                .font(.seiha3)
                .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    DeviceView()
        .preferredColorScheme(.dark)
        .environmentObject(DowngradingViewModel())
}
