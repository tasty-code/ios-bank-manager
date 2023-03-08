//
//  UserMenu.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/03/08.
//

import Foundation

enum UserMenu: CaseIterable {
    case openBank
    case exit

    init(input: String) throws {
        switch input {
        case "1":
            self = .openBank
        case "2":
            self = .exit
        default:
            throw InputError.invalidInput
        }
    }

    var description: String {
        switch self {
        case .openBank:
            return "1 : 은행개점"
        case .exit:
            return "2 : 종료"
        }
    }

    static var consoleMenuDescription: String {
        var consoleDescription = UserMenu.allCases.reduce("") { result, menu in
            return "\(result)\n\(menu.description)"
        }
        consoleDescription.removeFirst()
        return consoleDescription
    }
}
