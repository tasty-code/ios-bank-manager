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
    func runBank(with orders: [Order]) {
        let group = DispatchGroup()
        for order in orders {
            let taskManager = TaskManager()
            
            while let number = self.dispenser.provideTicket(of: order.taskType) {
                let client = Client(number: number, task: order.taskType)
                taskManager.enqueueClient(client)
            }
            
            (1...order.bankerCount).forEach { _ in
                let banker = Banker(bankerEnqueuable: taskManager, resultOut: self.textOut)
                taskManager.enqueueBanker(banker)
            }
            
            taskManager.startTaskManaging(group: group)
        }
        group.wait()
    }
}
