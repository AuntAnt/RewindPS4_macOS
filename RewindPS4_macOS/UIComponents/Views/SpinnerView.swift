//
//  SpinnerView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 14.09.2024.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(2.0, anchor: .center)
    }
}
