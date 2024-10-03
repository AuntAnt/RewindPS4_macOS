//
//  AnimatedStripedView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 28.09.2024.
//

import SwiftUI

struct AnimatedStripedView: View {
    var stripeWidth: CGFloat = 15.0
    var spacing: CGFloat = 15.0
    var stripeColor: Color = .gray.opacity(0.3)
    var backgroundColor: Color = .clear
    var animationSpeed: Double = 10.0

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let diagonalSpacing = stripeWidth + spacing

            TimelineView(.periodic(from: .now, by: 1/60)) { timeline in
                let currentTime = timeline.date.timeIntervalSinceReferenceDate
                let animatedOffset = (currentTime * animationSpeed).truncatingRemainder(dividingBy: diagonalSpacing)

                Canvas { context, _ in
                    context.fill(
                        Path { path in
                            var xOffset: CGFloat = -size.height
                            while xOffset < size.width + size.height {
                                path.move(to: CGPoint(x: xOffset + animatedOffset, y: 0))
                                path.addLine(to: CGPoint(x: xOffset - size.height + animatedOffset, y: size.height))
                                path.addLine(to: CGPoint(x: xOffset - size.height + stripeWidth + animatedOffset, y: size.height))
                                path.addLine(to: CGPoint(x: xOffset + stripeWidth + animatedOffset, y: 0))
                                path.closeSubpath()
                                xOffset += diagonalSpacing
                            }
                        },
                        with: .color(stripeColor)
                    )
                }
            }
            .background(backgroundColor)
        }
        .clipped()
    }
}

#Preview {
    AnimatedStripedView(stripeColor: .gray, backgroundColor: .black)
}
