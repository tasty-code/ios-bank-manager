//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 



func operateBank() {
    let bank = Bank(depositBankerCount: 1, loanBankerCount: 2)

    while true {
        Messages.menu.printMessage()
        if let choice = readLine(), let menu = Int(choice) {
            switch menu {
            case 1:
                bank.open()
            case 2:
                Messages.exit.printMessage()
                return
            default:
                Messages.menuError.printMessage()
            }
        } else {
            Messages.numberError.printMessage()
        }
    }
}

operateBank()
