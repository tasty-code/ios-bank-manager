//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bank = Bank()

BankManager.askMenu()
var chosenMenu = readLine()

while (chosenMenu ?? "") != BankManager.Menu.close.rawValue {
    let numberOfCustomers = BankManager.ExpectedNumberOfCustomers.random
    
    bank.receive(numberOfCustomers: numberOfCustomers)
    bank.lineUpCustomersInQueue()
    bank.handleAllCustomers()
    BankManager.askMenu()
    
    chosenMenu = readLine()
}

