//
//  GuideLinkLabel.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 16.09.2024.
//

import SwiftUI

struct GuideLinkLabel: View {
    
    private var guideUrl: URL {
        if let lang = Locale.preferredLanguages.first, lang.contains("zh") {
            return URL(string: Links.guiderCh)!
        } else {
            return URL(string: Links.guideEn)!
        }
    }
    
    var body: some View {
        HStack {
            Spacer()
            Link(LocalizationKeys.guide.rawValue, destination: guideUrl)
                .foregroundStyle(.accent)
                .underline(color: .accent)
        }
    }
}

#Preview {
    GuideLinkLabel()
}
