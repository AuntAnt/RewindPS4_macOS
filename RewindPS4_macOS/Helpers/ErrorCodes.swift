//
//  ErrorCodes.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 22.09.2024.
//

import Foundation

protocol ErrorCode {
    var value: String { get }
}

struct ErrorCodeInfo: Identifiable {
    var id = UUID()
    
    let code: ErrorCode
    let description: String
}

enum PS5ErrorCode: ErrorCode {
    case cusaMismatch
    case specialIssue
    case blocked
    case blocked2
    
    var value: String {
        switch self {
        case .cusaMismatch:
            "CE-107893-8"
        case .specialIssue:
            "CE-107889-3"
        case .blocked:
            "NW-102650-4"
        case .blocked2:
            "NW-102261-2"
        }
    }
}

enum PS4ErrorCode: ErrorCode {
    case blockedPS4
    case cusaMismatch
    case netError
    
    var value: String {
        switch self {
        case .blockedPS4:
            "NW-31468-2"
        case .cusaMismatch:
            "CE-36246-1"
        case .netError:
            "NW-31472-7"
        }
    }
}
