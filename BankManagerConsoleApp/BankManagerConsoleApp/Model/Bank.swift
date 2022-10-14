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
    
    var clientNumber: Int = 0
    var workTime: Double = 0.0
    var clientQueue: Queue<Int>?
    
    mutating func openBank() {
        showMenu()
    }
    
    mutating func startWork() {
        clientNumber = generateRandomClientNumber()
        clientQueue = inputClient(clientNumber: clientNumber)
        guard var queue = clientQueue else { return }
        
        for _ in 1...clientNumber {
            
            guard let client = queue.dequeue() else { return }
            bankService(for: client)
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientNumber)명이며, 총 업무시간은 \(String(format: "%.2f", workTime))초 입니다.")
    }
    
    mutating func bankService(for client: Int) {
        print("\(client) 번 고객 업무시작")
        print("\(client) 번 고객 업무종료")
        workTime += 0.7
    }
}
