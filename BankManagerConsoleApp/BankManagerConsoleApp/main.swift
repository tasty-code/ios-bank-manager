//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bank = Bank(clerks: [BankClerkForDeposit()])

ConsoleManager.askMenu()
var chosenMenu = readLine()

while (chosenMenu ?? "") != ConsoleManager.Menu.close.rawValue {
    bank.open()
    bank.close()
    ConsoleManager.askMenu()
    
    chosenMenu = readLine()
}

