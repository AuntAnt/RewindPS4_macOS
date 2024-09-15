//
//  SpinnerView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 14.09.2024.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(2.0, anchor: .center)
    }
}
