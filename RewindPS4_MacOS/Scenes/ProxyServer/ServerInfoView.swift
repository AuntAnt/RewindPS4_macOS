//
//  ServerInfoView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 31.08.2024.
//

import SwiftUI

struct ServerInfoView: View {
    
    let title: String
    @Binding var isEditable: Bool
    var isStepperNeeded = false
    @Binding var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.descriptionText)
            
            TextField(title, text: $value)
                .frame(width: 200, height: 30)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 4)
                .disabled(!isEditable)
                .foregroundStyle(.infoText)
                .background { Color.black.opacity(0.6) }
                .overlay(alignment: .trailing) {
                    if isEditable, isStepperNeeded {
                        Stepper("", value: $value.integer, in: 0...65535).padding(.horizontal, 3)
                    }
                }
        }
        .font(.seiha2)
    }
}

#Preview {
    ServerInfoView(title: "Label:", isEditable: .constant(true), isStepperNeeded: true, value: .constant("8080"))
        .preferredColorScheme(.dark)
        .padding()
}
