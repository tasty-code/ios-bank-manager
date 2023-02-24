//
//  ErrorProcess.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/23.
//

import Foundation

enum Errors: LocalizedError {
    case invalidUserInput
    case failOfFormatToString
    
    var errorDescription: String? {
        return NSLocalizedString("Error Type: \(self)", comment: "")
    }
}
