//
//  InfoLabelView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct InfoLabelView: View {
    
    let title: String
    @State var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .overlay(alignment: .leading) {
                    HStack {
                        Spacer().frame(width: 3)
                        Text(title)
                            .foregroundStyle(.descriptionText)
                    }
                }
                .foregroundStyle(.black)
            
            Rectangle()
                .overlay(alignment: .leading) {
                    HStack {
                        Spacer().frame(width: 3)
                        Text(value)
                            .foregroundStyle(.accent)
                    }
                }
                .foregroundStyle(.black.opacity(0.4))
        }
        .frame(minWidth: 200, idealWidth: 250, minHeight: 30, idealHeight: 30, maxHeight: 50)
    }
}

#Preview {
    InfoLabelView(title: "Game Name:", value: "N/A")
        .padding()
}
