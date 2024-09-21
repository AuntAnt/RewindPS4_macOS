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
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.inputMessage)
                    .foregroundStyle(.title)
                    .font(.title2)
                
                Spacer()
            }
            
            TextField("", text: $viewModel.jsonLink, axis: .vertical)
                .foregroundStyle(.infoText)
                .frame(height: 55)
                .frame(idealWidth: 55, maxHeight: 65)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 4)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .focused($isEditing)
                .disabled(viewModel.isServerRunning)
                .onTapGesture {
                    isEditing = true
                }
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(square: 10))
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color.gray)
                        .shadow(color: .white, radius: isEditing ? 5 : 0)
                }
                .onReceive(viewModel.$jsonLink.debounce(for: .seconds(1), scheduler: RunLoop.main)) { _ in
                    Task {
                        await viewModel.validateInput()
                    }
                }
            
            GameInfoView(gameInfo: $viewModel.gameInfo)
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
