//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

/// DI
let linkedListQueue = LinkedListQueue<Customer>()
let consoleMessage = ConsoleMessage()
let bank = Bank(customerQueue: linkedListQueue, consoleMessage: consoleMessage)
let bankController = BankController(bank: bank)

bankController.runBankApp()
