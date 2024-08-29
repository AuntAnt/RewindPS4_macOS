//
//  StartButton.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 30.08.2024.
//

import SwiftUI

struct StartButton: View {
    
    private enum StateLabels {
        static let start = "Stop Server"
        static let stop = "Start Server"
    }
    
    @State private var title = StateLabels.start
    @State private var isRunning = false
    
    var body: some View {
        Button(title) {
            toggleServer()
        }
    }
    
    private func toggleServer() {
        isRunning.toggle()
        title = isRunning ? StateLabels.stop : StateLabels.start
    }
}
