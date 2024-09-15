//
//  Binding+.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

// MARK: - Int to String
extension Binding where Value == Int {
    var string: Binding<String> {
        return Binding<String>(
            get: { String(self.wrappedValue) },
            set: { self.wrappedValue = Int($0) ?? 0 }
        )
    }
}

// MARK: - String to Int
extension Binding where Value == String {
    var integer: Binding<Int> {
        return Binding<Int>(
            get: { Int(self.wrappedValue) ?? 0 },
            set: { self.wrappedValue = $0.description }
        )
    }
}

extension Binding where Value == Bool {
    var not: Binding<Bool> {
        return Binding<Bool>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = $0 }
        )
    }
}
