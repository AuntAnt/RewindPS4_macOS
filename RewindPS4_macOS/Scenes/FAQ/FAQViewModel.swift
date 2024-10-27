//
//  FAQViewModel.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 22.09.2024.
//

import SwiftUI

final class FAQViewModel: ObservableObject {
    @Published var isShowingFAQ = false
    
    private typealias Localization = LocalizationKeys.FAQ.Error
    
    func getPS5Errors() -> [ErrorCodeInfo] {
        return [
            ErrorCodeInfo(code: PS5ErrorCode.cusaMismatch, description: Localization.PS5.cusaMismatch),
            ErrorCodeInfo(code: PS5ErrorCode.specialIssue, description: Localization.PS5.specialIssue),
            ErrorCodeInfo(code: PS5ErrorCode.blocked, description: Localization.PS5.blocked),
            ErrorCodeInfo(code: PS5ErrorCode.blocked2, description: Localization.PS5.blocked2)
        ]
    }
    
    func getPS4Errors() -> [ErrorCodeInfo] {
        return [
            ErrorCodeInfo(code: PS4ErrorCode.blockedPS4, description: Localization.PS4.blockedPS4),
            ErrorCodeInfo(code: PS4ErrorCode.cusaMismatch, description: Localization.PS4.cusaMismatch),
            ErrorCodeInfo(code: PS4ErrorCode.netError, description: Localization.PS4.netError)
        ]
    }
    
    func getOtherErrors() -> [String] {
        return [
            Localization.Other.otherError1,
            Localization.Other.otherError2
        ]
    }
}
