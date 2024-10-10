//
//  ModeOneView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

struct ModeOneView: View {
    
    @EnvironmentObject private var viewModel: DowngradingViewModel
    @FocusState private var isEditing: Bool
    @State private var isHover = false
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(viewModel.inputMessage)
                    .foregroundStyle(.title)
                    .font(.title2)
                
                Spacer()
            }
            
            TextField("", text: $viewModel.jsonLink, axis: .vertical)
                .foregroundStyle(.infoText)
                .frame(height: 85)
                .textFieldStyle(.plain)
                .padding(.horizontal, 4)
                .multilineTextAlignment(.leading)
                .lineLimit(5)
                .focused($isEditing)
                .disabled(viewModel.isServerRunning)
                .onTapGesture {
                    isEditing = true
                }
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(square: 5))
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color.gray)
                        .shadow(color: .white, radius: isEditing || (isHover && !viewModel.isServerRunning) ? 5 : 0)
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
        .environmentObject(DowngradingViewModel())
        .preferredColorScheme(.dark)
}
