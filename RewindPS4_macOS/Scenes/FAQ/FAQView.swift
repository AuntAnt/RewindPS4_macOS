//
//  FAQView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 22.09.2024.
//

import SwiftUI

struct FAQView: View {
    
    @ObservedObject var viewModel: FAQViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizationKeys.errorCode.rawValue)
                .foregroundStyle(.title)
                .font(.title2)
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    // MARK: - PS5 errors
                    
                    Text("PS5:")
                        .font(.title3)
                        .foregroundStyle(.infoText)
                    ForEach(viewModel.getPS5Errors()) { error in
                        FAQViewCell(title: error.code, description: error.description)
                    }
                    
                    // MARK: - PS4 errors
                    
                    Text("PS4:")
                        .font(.title3)
                        .foregroundStyle(.infoText)
                    ForEach(viewModel.getPS4Errors()) { error in
                        FAQViewCell(title: error.code, description: error.description)
                    }
                    
                    // MARK: - Other errors
                    
                    Text(LocalizationKeys.otherError.rawValue)
                        .font(.title3)
                        .foregroundStyle(.infoText)
                    
                    ForEach(viewModel.getOtherErrors(), id: \.self) { error in
                        Text(error.rawValue)
                            .lineLimit(3)
                            .font(.title3)
                            .foregroundStyle(.descriptionText)
                    }
                }
            }
        }
        .padding()
        .background(content: {
            Color.background
        })
        .border(Color.black)
        .overlay(alignment: .topTrailing) {
            DismissButton(action: { viewModel.isShowingFAQ = false })
        }
    }
}

#Preview {
    FAQView(viewModel: FAQViewModel())
        .preferredColorScheme(.dark)
        .padding()
}
