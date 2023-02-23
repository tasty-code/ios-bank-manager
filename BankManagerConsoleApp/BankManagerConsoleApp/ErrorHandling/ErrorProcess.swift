//
//  ErrorProcess.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/23.
//

import Foundation

enum UserInputError: LocalizedError {
    case invalidUserInput
    
    var errorDescription: String? {
        return NSLocalizedString("Description of invalid user Input Value", comment: "Invalid User Input")
    }
}

enum FailFormatting: LocalizedError {
    case failOfFormatToString
    
    var errorDescription: String? {
        return NSLocalizedString("Description of fail formatting to String", comment: "Fail to format String")
    }
}
