//
//  LogsScrollView.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 21.09.2024.
//

import SwiftUI

struct LogsScrollView: View {
    
    @Binding var logs: [String]
    @Binding var autoscroll: Bool
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(logs.indices, id: \.self) { index in
                        Text(attributeText(logs[index]))
                            .padding(.vertical, 1)
                            .id(index)
                            .padding(.horizontal, 4)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 315, alignment: .leading)
            .background {
                Color.gray.opacity(0.1)
            }
            .onChange(of: logs) { _ in
                guard autoscroll else {
                    return
                }
                
                if let lastLogIndex = logs.indices.last {
                    withAnimation {
                        proxy.scrollTo(lastLogIndex)
                    }
                }
            }
        }
    }
    
    private func attributeText(_ text: String) -> AttributedString {
        let parts = text.split(separator: "-", maxSplits: 2)
        
        var result = AttributedString()
        let space = AttributedString(" ")
        
        var first = AttributedString(parts[0])
        first.foregroundColor = .descriptionText
        
        var second = AttributedString(parts[1])
        second.foregroundColor = .accent
        
        var third = AttributedString(parts[2])
        third.foregroundColor = .infoText
        
        result.append(first)
        result.append(space)
        result.append(second)
        result.append(space)
        result.append(third)
        
        return result
    }
}
