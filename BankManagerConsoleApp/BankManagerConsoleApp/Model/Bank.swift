//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Bank: BankManager {
    
    var workTime: Double = 0.0
    var clientQueue: Queue<Client>?
    var bankClerkList: [BankClerk] = []

    mutating func openBank() {
        showMenu()
        input()
    }
    
    mutating func startWork() {
        let clientNumber = generateRandomClientNumber()
        clientQueue = inputClient(clientNumber: clientNumber)
    }
}
