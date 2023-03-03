//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private enum UserMenu {
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
}

var bankManager = BankManager()

func execute() {
    ConsoleManager.presentUserMenu()
    let input = readLine() ?? ""

    do {
        let menu = try UserMenu(input: input)

        switch menu {
        case .openBank:
            bankManager.open()
            execute()
        case .exit:
            break
        }
    } catch {
        print(error.localizedDescription)
        execute()
    }
}

execute()
