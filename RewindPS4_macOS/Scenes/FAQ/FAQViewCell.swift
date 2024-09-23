//
//  FAQViewCell.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 22.09.2024.
//

import SwiftUI

struct FAQViewCell: View {
    
    let title: ErrorCode
    let description: LocalizationKeys
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.value)
                .font(.seiha1)
                .foregroundStyle(.accent)
            
            Text(description.rawValue)
                .lineLimit(3)
                .font(.title3)
                .foregroundStyle(.descriptionText)
        }
    }
}

#Preview {
    FAQViewCell(title: PS5ErrorCode.cusaMismatch, description: LocalizationKeys.CUSAMismatch)
        .padding()
        .preferredColorScheme(.dark)
}
