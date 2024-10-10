//
//  ServerInfoView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 31.08.2024.
//

import SwiftUI

struct ServerInfoView: View {
    
    let title: LocalizedStringKey
    var isEditable = false
    var isStepperNeeded = false
    @Binding var value: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.descriptionText)
                .font(.seiha2)
            
            TextField(title, text: $value)
                .frame(width: 200, height: 30)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 4)
                .disabled(!isEditable)
                .foregroundStyle(color)
                .background { Color.black.opacity(0.6) }
                .overlay(alignment: .trailing) {
                    if isEditable, isStepperNeeded {
                        Stepper("", value: $value.integer, in: 0...65535).padding(.horizontal, 3)
                    }
                }
                .font(.seiha3)
        }
    }
}

#Preview {
    ServerInfoView(
        title: "Label:",
        isEditable: true,
        isStepperNeeded: true,
        value: .constant("8080"),
        color: .infoText
    )
        .preferredColorScheme(.dark)
        .padding()
}
