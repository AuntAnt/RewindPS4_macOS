//
//  Binding.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 01.09.2024.
//

import SwiftUI

//extension Binding where Value == Int {
//    var string: Binding<String> {
//        return Binding<String>(
//            get: { String(wrappedValue.description) }
//            set: { self.wrappedValue = Int($0) ?? 0 }
//        )
//    }
//}

extension Binding where Value == Int {
    var string: Binding<String> {
        return Binding<String>(
            get: { String(self.wrappedValue) },
            set: { self.wrappedValue = Int($0) ?? 0 }
        )
    }
}
