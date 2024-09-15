//
//  BackgroundView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        GeometryReader { geometry in
            Image(ImageName.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .opacity(0.98)
        }
    }
}

#Preview {
    BackgroundView()
}
