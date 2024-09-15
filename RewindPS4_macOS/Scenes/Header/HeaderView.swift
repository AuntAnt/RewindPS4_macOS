//
//  HeaderView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(ImageName.header)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 600, idealWidth: 600, minHeight: 80, idealHeight: 80, maxHeight: 80)
            
            Spacer()
            
            DeviceView()
        }
    }
}

#Preview {
    HeaderView()
}
