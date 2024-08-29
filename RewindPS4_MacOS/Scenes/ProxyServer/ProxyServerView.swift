//
//  ProxyServerView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ProxyServerView: View {
    
    @State private var port = "8080"
    @State private var serverStateLabel = "Server is not running"
    
    var body: some View {
        VStack {
            HStack {
                Text("PROXY SERVER")
                    .font(.seiha1)
                    .foregroundStyle(.title)
                
                Spacer()
            }
            
            VStack(alignment: .trailing) {
                ServerInfoView(title: "Local IP:", text: "192.168.99.191")
                ServerInfoView(title: "Port:", text: "8080")
            }
            
            Text(serverStateLabel)
                .foregroundStyle(.white)
                .padding()
            
            StartButton()
        }
        .padding()
        .border(.gray, width: 1)
    }
}

#Preview {
    ProxyServerView()
        .background {
            BackgroundView()
        }
}
