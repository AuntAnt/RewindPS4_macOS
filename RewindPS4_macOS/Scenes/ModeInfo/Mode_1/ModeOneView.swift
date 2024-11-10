//
//  ModeOneView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

struct ModeOneView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    @State private var isHover = false
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(viewModel.inputMessage)
                    .foregroundStyle(.title)
                    .font(.title2)
                
                Spacer()
            }
            
            TextEditor(text: $viewModel.jsonLink)
                .foregroundStyle(.infoText)
                .frame(height: 85)
                .padding(2)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .lineLimit(5)
                .disabled(viewModel.isServerRunning)
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(square: 5))
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color.gray)
                        .shadow(color: .white, radius: isHover && !viewModel.isServerRunning ? 5 : 0)
                }
                .onReceive(viewModel.$jsonLink.debounce(for: .seconds(1), scheduler: RunLoop.main)) { _ in
                    Task {
                        await viewModel.validateInput()
                    }
                }
                .onHover { hovering in
                    isHover = hovering
                }
            
            GameInfoView(gameInfo: viewModel.gameInfo)
        }
        .overlay(alignment: .center) {
            if viewModel.isGameInfoLoading {
                SpinnerView()
            }
        }
    }
}

#Preview {
    ModeOneView()
        .preferredColorScheme(.dark)
}
