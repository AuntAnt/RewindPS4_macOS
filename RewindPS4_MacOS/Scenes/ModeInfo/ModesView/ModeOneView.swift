//
//  ModeOneView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

struct ModeOneView: View {
    
    @State private var jsonLink: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Please enter the JSON link:")
                    .foregroundStyle(.title)
                .font(.title2)
                
                Spacer()
            }
            
            TextField("", text: $jsonLink, axis: .vertical)
                .placeholder("", when: jsonLink.isEmpty)
                .foregroundStyle(.infoText)
                .frame(height: 55)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 4)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .border(Color.gray)
            
            HStack {
                Image(ImageName.waiting)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 180, idealWidth: 180, maxWidth: 210, minHeight: 180, idealHeight: 180, maxHeight: 400)
                
                Spacer().frame(width: 15)
                
                VStack(alignment: .leading, spacing: 0) {
                    InfoLabelView(title: "Game Name:", value: "Waiting...")
                    InfoLabelView(title: "Game ID & Region:", value: "Waiting...")
                    InfoLabelView(title: "Last Version:", value: "Waiting...")
                    InfoLabelView(title: "Downgrade Version:", value: "Waiting...")
                }
                .foregroundStyle(.descriptionText)
            }
        }
        .padding()
        .border(.gray)
        .padding()
    }
}

#Preview {
    ModeOneView()
        .preferredColorScheme(.dark)
}
