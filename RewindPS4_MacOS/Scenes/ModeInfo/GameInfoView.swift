//
//  GameInfoView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 06.09.2024.
//

import SwiftUI

struct GameInfoView: View {
    @Binding var gameInfo: GameInfo?
    
    private let placeholder = "Waiting..."
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: gameInfo?.imageCover ?? "")) { image in
                    image.defaultModifier()
                } placeholder: {
                    Image(gameInfo != nil ? ImageName.nocover : ImageName.waiting).defaultModifier()
                }
            
            Spacer().frame(width: 15)
            
            VStack(alignment: .leading, spacing: 0) {
                InfoLabelView(
                    title: "Game Name:",
                    value: Binding(
                        get: { gameInfo?.title ?? placeholder },
                        set: { _ in }
                    )
                )
                InfoLabelView(
                    title: "Game ID & Region:",
                    value: Binding(
                        get: { gameInfo?.cusa ?? placeholder },
                        set: { _ in }
                    )
                )
                InfoLabelView(
                    title: "Last Version:",
                    value: Binding(
                        get: { gameInfo?.lastVersion ?? placeholder },
                        set: {_ in}
                    )
                )
                InfoLabelView(
                    title: "Downgrade Version:",
                    value: Binding(
                        get: { gameInfo?.downgradeVersion ?? placeholder },
                        set: {_ in}
                    )
                )
            }
            .foregroundStyle(.descriptionText)
        }
    }
}

#Preview {
    GameInfoView(gameInfo: .constant(nil))
}
