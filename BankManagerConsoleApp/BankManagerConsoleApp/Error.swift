//
//  Error.swift
//  BankManagerConsoleApp
//
//  Created by Lee minyeol on 1/25/24.
//

import Foundation

enum QueueError: LocalizedError {
    case dequeueError
    
    var errorDescription: String? {
        switch self {
        case .dequeueError:
            "값을 빼내지 못했습니다."
        }
    }
}
