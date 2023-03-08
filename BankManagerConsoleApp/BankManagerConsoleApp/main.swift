//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager()

func execute() {
    ConsoleManager.presentUserMenu()
    let input = readLine() ?? ""

    do {
        let menu = try UserMenu(input: input)

        switch menu {
        case .openBank:
            bankManager.open(completion: {
                execute()
            })
        case .exit:
            exit(EXIT_SUCCESS)
        }
    } catch {
        print(error.localizedDescription)
        execute()
    }
}

execute()
dispatchMain()
