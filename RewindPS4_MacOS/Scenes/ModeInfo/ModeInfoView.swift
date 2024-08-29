//
//  ModeInfoView.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 29.08.2024.
//

import SwiftUI

struct ModeInfoView: View {
    
    @State private var modeSelected = true
    
    var body: some View {
        if modeSelected {
            ModeOneView()
        } else {
            NoModePlaceholderView()
                .padding()
                .border(.gray)
                .padding()
        }
        
    }
}

#Preview {
    ModeInfoView()
        .preferredColorScheme(.dark)
}
