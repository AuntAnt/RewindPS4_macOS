//
//  GameInfoView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 06.09.2024.
//

import SwiftUI

struct GameInfoView: View {
    
    @Binding var gameInfo: GameInfo?
    
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
                    title: LocalizationKeys.gameName.rawValue,
                    value: Binding(
                        get: { gameInfo?.title },
                        set: { _ in }
                    )
                )
                InfoLabelView(
                    title: LocalizationKeys.gameIDRegion.rawValue,
                    value: Binding(
                        get: { gameInfo?.cusa },
                        set: { _ in }
                    )
                )
                InfoLabelView(
                    title: LocalizationKeys.lastVersion.rawValue,
                    value: Binding(
                        get: { gameInfo?.lastVersion },
                        set: { _ in }
                    )
                )
                InfoLabelView(
                    title: LocalizationKeys.downgradeVersion.rawValue,
                    value: Binding(
                        get: { gameInfo?.downgradeVersion },
                        set: { _ in }
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
