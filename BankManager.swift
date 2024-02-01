//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let textOut: TextOutputDisplayable
    
    init(textOut: TextOutputDisplayable) {
        self.textOut = textOut
    }
}

extension BankManager: BankRunnable {
    func runBank(with orders: [Order]) {
        let group = DispatchGroup()
        for order in orders {
            // 각각 task별 taskManager 만들기
            let taskManager = TaskManager()
            
            // 수에 따라 client 만들기
            order.clientNumbers.sorted(by: <).forEach { number in
                let client = Client(number: number, task: order.taskType.init())
                taskManager.enqueueClient(client)
            }
            
            // 수에 따라 banker 만들기
            // enqueue client, banker
            
            (1...order.bankerCount).forEach { _ in
                let banker = Banker(bankerEnqueuable: taskManager, resultOut: self.textOut)
                taskManager.enqueueBanker(banker)
            }
            
            taskManager.startTaskManaging(group: group)
        }
        group.wait()
    }
}

//struct TaskThingsFactory {
//    static func make(order: [Order]) {
//        
//    }
//}
