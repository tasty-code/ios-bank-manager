//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Menu: String {
    case bankOpen = "1"
    case BankClose = "2"
}

struct Bank: BankManager {
    
    var workTime: Double = 0.0
    var clientQueue: Queue<Client>?
    var bankClerk = BankClerk()

    mutating func openBank() {
        showMenu()
    }
    
    mutating func startWork() {
        let clientNumber = generateRandomClientNumber()
        clientQueue = inputClient(clientNumber: clientNumber)
        guard var queue = clientQueue else { return }
        
        while ((clientQueue?.isEmpty) != nil) {
            guard let client = queue.dequeue() else {
                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientNumber)명이며, 총 업무시간은 \(roundToString(in: workTime))초 입니다.")
                return
            }
            bankClerk.bankService(for: client)
            workTime += Double.processingTime
        }
    }
    
    
}
