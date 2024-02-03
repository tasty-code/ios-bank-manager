//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let textOut: TextOutputDisplayable
    
    private let dispenser: TicketDispenser
    
    init(
        textOut: TextOutputDisplayable,
        dispenser: TicketDispenser
    ) {
        self.textOut = textOut
        self.dispenser = dispenser
    }
}

extension BankManager: BankRunnable {
    func runBank(with orders: [Order], numberOfClient: Int) {
        let group = DispatchGroup()
        let totalWorkTime = measure {
            for order in orders {
                let taskManager = TaskManager()
                makeClients(order: order, taskManager: taskManager)
                makeBankers(order: order, taskManager: taskManager)
                taskManager.startTaskManaging(group: group)
            }
            group.wait()
        }
        
        summarizeDailyStatistics(
            totalWorkTime: totalWorkTime,
            numberOfClient: numberOfClient
        )
    }
}

private extension BankManager {
    func makeBankers(order: Order, taskManager: TaskManager) {
        (1...order.bankerCount).forEach { _ in
            let banker = Banker(bankerEnqueuable: taskManager, resultOut: self.textOut)
            taskManager.enqueueBanker(banker)
        }
    }
    
    func makeClients(order: Order, taskManager: TaskManager) {
        while let number = self.dispenser.provideTicket(of: order.taskType) {
            let client = Client(number: number, task: order.taskType)
            taskManager.enqueueClient(client)
        }
    }
    
    func measure(_ progress: () -> Void) -> TimeInterval {
        let start = Date()
        progress()
        return Date().timeIntervalSince(start)
    }
    
    func summarizeDailyStatistics(totalWorkTime: Double, numberOfClient: Int) {
        let roundedWorkTimeString = String(format: "%.2f", totalWorkTime)
        let output = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(roundedWorkTimeString)초입니다."
        self.textOut.display(output: output)
    }
}
