//
//  GameInfoView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 06.09.2024.
//

import SwiftUI

struct GameInfoView: View {
    
    var gameInfo: GameInfo?
    
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
                    value: gameInfo?.title
                )
                InfoLabelView(
                    title: LocalizationKeys.gameIDRegion.rawValue,
                    value: gameInfo?.cusa
                )
                InfoLabelView(
                    title: LocalizationKeys.lastVersion.rawValue,
                    value: gameInfo?.lastVersion
                )
                InfoLabelView(
                    title: LocalizationKeys.downgradeVersion.rawValue,
                    value: gameInfo?.downgradeVersion
                )
            }
            .foregroundStyle(.descriptionText)
        }
    }
}

#Preview {
    GameInfoView(gameInfo: nil)
}
