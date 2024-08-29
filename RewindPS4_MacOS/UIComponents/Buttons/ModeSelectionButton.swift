//
//  ModeSelectionButton.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct ModeSelectionButton: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.seiha1)
                    .foregroundStyle(.title)
                Spacer()
            }
            Text(description)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .border(.black)
        .padding()
    }
}
