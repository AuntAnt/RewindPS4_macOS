//
//  StripedView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 05.10.2024.
//

import SwiftUI

struct StripedViewModel {
    var stripeWidth: CGFloat = 15.0
    var spacing: CGFloat = 15.0
    var stripeColor: Color = .gray.opacity(0.3)
    var backgroundColor: Color = .clear
    var animationSpeed: Double = 10.0
}

struct StripedView: View {
    let viewModel: StripedViewModel

    @State private var animationOffset: CGFloat = 0
    
    private var diagonalSpacing: CGFloat {
        return viewModel.stripeWidth + viewModel.spacing
    }
    
    init(viewModel: StripedViewModel = StripedViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Rectangle()
            .mask {
                StripedShape(offset: animationOffset, stripeWidth: viewModel.stripeWidth, spacing: viewModel.spacing)
                    .fill(viewModel.stripeColor)
                    .onAppear {
                        withAnimation(
                            .linear(duration: diagonalSpacing / viewModel.animationSpeed)
                            .repeatForever(autoreverses: false)
                        ) {
                            animationOffset = diagonalSpacing
                        }
                    }
                    .clipped()
                    .opacity(0.55)
            }
    }
}


struct StripedShape: Shape {
    var offset: CGFloat
    var stripeWidth: CGFloat
    var spacing: CGFloat
    
    var animatableData: CGFloat {
        get { offset }
        set { offset = newValue }
    }

    func path(in rect: CGRect) -> Path {
        let diagonalSpacing = stripeWidth + spacing
        
        var path = Path()
        var xOffset: CGFloat = -rect.height
    
        while xOffset < rect.width + rect.height + diagonalSpacing {
            path.move(to: CGPoint(x: xOffset + offset, y: 0))
            path.addLine(to: CGPoint(x: xOffset - rect.height + offset, y: rect.height))
            path.addLine(to: CGPoint(x: xOffset - rect.height + stripeWidth + offset, y: rect.height))
            path.addLine(to: CGPoint(x: xOffset + stripeWidth + offset, y: 0))
            path.closeSubpath()
            xOffset += diagonalSpacing
        }

        return path
    }
}
