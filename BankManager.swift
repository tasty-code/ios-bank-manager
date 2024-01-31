//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    
}

extension BankManager: BankRunnable {
    func runBank(with orders: [Order]) {
        for order in orders {
            // 수에 따라 client 만들기
            let clients = (1...order.clientCount).map { number in
                Client(number: number, task: order.taskType.init())
            }
            
            // 수에 따라 banker 만들기
            let banker = (1...order.bankerCount).map {
                
            }
            
            // 각각 task별 taskManager 만들기
        }
    }
}

struct TaskThingsFactory {
    static func make(order: [Order])
}
