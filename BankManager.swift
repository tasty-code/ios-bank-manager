//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let textOut: TextOutputDisplayable
}

extension BankManager: BankRunnable {
    func runBank(with orders: [Order]) {
        for order in orders {
            // 각각 task별 taskManager 만들기
            let taskManager = TaskManager()
            
            // 수에 따라 client 만들기
            let clients = (1...order.clientCount).map { number in
                Client(number: number, task: order.taskType.init())
            }
            
            // 수에 따라 banker 만들기
            let bankers = (1...order.bankerCount).map { _ in
                Banker(
                    bankerEnqueuable: taskManager,
                    resultOut: self.textOut
                )
            }
            
            // enqueue client, banker
            bankers.forEach { banker in taskManager.enqueueBanker(banker) }
            clients.forEach { client in taskManager.enqueueClient(client) }
            
            taskManager.startTaskManaging()
        }
    }
}

//struct TaskThingsFactory {
//    static func make(order: [Order]) {
//        
//    }
//}
