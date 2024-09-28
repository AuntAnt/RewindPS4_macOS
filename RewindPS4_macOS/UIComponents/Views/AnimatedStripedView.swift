//
//  AnimatedStripedView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 28.09.2024.
//

import SwiftUI

struct AnimatedStripedView: View {
    var stripeWidth: CGFloat = 10.0
    var spacing: CGFloat = 10.0
    var stripeColor: Color = .gray.opacity(0.3)
    var backgroundColor: Color = .clear
    var animationSpeed: Double = 50.0

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let diagonalSpacing = stripeWidth + spacing
            
            TimelineView(.animation) { timeline in
                let currentTime = timeline.date.timeIntervalSinceReferenceDate
                let animatedOffset = currentTime.truncatingRemainder(dividingBy: animationSpeed) * diagonalSpacing

                Canvas { context, _ in
                    context.fill(
                        Path { path in
                            var xOffset: CGFloat = -size.height - CGFloat(animatedOffset)
                            while xOffset < size.width {
                                path.move(to: CGPoint(x: xOffset, y: 0))
                                path.addLine(to: CGPoint(x: xOffset + size.height, y: size.height))
                                path.addLine(to: CGPoint(x: xOffset + size.height + stripeWidth, y: size.height))
                                path.addLine(to: CGPoint(x: xOffset + stripeWidth, y: 0))
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
