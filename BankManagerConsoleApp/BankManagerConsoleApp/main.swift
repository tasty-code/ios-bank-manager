//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bank = Bank(clerks: [BankClerk()])

ConsoleManager.askMenu()
var chosenMenu = readLine()

while (chosenMenu ?? "") != ConsoleManager.Menu.close.rawValue {
    bank.lineUpCustomersInQueue()
    bank.handleAllCustomers()
    ConsoleManager.askMenu()
    
    chosenMenu = readLine()
}

