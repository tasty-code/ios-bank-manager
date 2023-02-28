//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bank = Bank()

ConsoleManager.askMenu()
var chosenMenu = readLine()

while (chosenMenu ?? "") != ConsoleManager.Menu.close.rawValue {
    let numberOfCustomers = ConsoleManager.ExpectedNumberOfCustomers.random
    
    bank.receive(numberOfCustomers: numberOfCustomers)
    bank.lineUpCustomersInQueue()
    bank.handleAllCustomers()
    ConsoleManager.askMenu()
    
    chosenMenu = readLine()
}

