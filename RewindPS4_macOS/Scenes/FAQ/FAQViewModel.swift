//
//  FAQViewModel.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 22.09.2024.
//

import SwiftUI

final class FAQViewModel: ObservableObject {
    @Published var isShowingFAQ = false
    
    func getPS5Errors() -> [ErrorCodeInfo] {
        return [
            ErrorCodeInfo(code: PS5ErrorCode.cusaMismatch, description: .CUSAMismatch),
            ErrorCodeInfo(code: PS5ErrorCode.specialIssue, description: .SpecialIssue),
            ErrorCodeInfo(code: PS5ErrorCode.blocked, description: .blocked),
            ErrorCodeInfo(code: PS5ErrorCode.blocked2, description: .blocked2)
        ]
    }
    
    func getPS4Errors() -> [ErrorCodeInfo] {
        return [
            ErrorCodeInfo(code: PS4ErrorCode.blockedPS4, description: .blockedPS4),
            ErrorCodeInfo(code: PS4ErrorCode.cusaMismatch, description: .CUSAMismatch),
            ErrorCodeInfo(code: PS4ErrorCode.netError, description: .netError)
        ]
    }
    
    func getOtherErrors() -> [LocalizationKeys] {
        return [
            .otherError1,
            .otherError2
        ]
    }
}
