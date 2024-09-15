//
//  RewindPS4_macOSApp.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

@main
struct RewindPS4_macOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 1000, height: 800)
        }
        .windowResizability(.contentSize)
    }
}
