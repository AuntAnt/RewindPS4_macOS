//
//  HeaderView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(ImageName.header)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            DeviceView()
        }
        .frame(width: 970, height: 100)
    }
}

#Preview {
    HeaderView()
}
