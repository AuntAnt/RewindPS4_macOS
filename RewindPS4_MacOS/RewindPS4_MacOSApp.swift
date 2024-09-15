//
//  RewindPS4_MacOSApp.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

@main
struct RewindPS4_MacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 1000, height: 800)
        }
        .windowResizability(.contentSize)
    }
}
