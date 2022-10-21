//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Bank {
    let dispatchGroup = DispatchGroup()
    var totalTime: Double = 0
    
    mutating func startBank(clientQueue: Queue<Client>, bankClerks: [WorkType: BankClerk]) {
        var queue = clientQueue
        
        guard let depoitClerks = bankClerks[.deposit],
              let loanClerks = bankClerks[.loan] else { return }
        
        let despositClerkSemaphore = DispatchSemaphore(value: depoitClerks.count)
        let loanClerkSemaphore = DispatchSemaphore(value: loanClerks.count)
        
        while !clientQueue.isEmpty {
            guard let client = queue.dequeue() else { return }
            
            switch client.workType {
            case .loan:
                working(banker: loanClerks, client: client, semaphore: loanClerkSemaphore)
                totalTime += WorkType.loan.time
            case .deposit:
                working(banker: depoitClerks, client: client, semaphore: despositClerkSemaphore)
                totalTime += WorkType.deposit.time
            }
        }
    }
    
    private func working(banker: BankClerk, client: Client, semaphore: DispatchSemaphore) {
        let work = DispatchWorkItem {
            semaphore.wait()
            banker.bankService(in: client)
            semaphore.signal()
        }
        DispatchQueue.global().async(group: self.dispatchGroup, execute: work)
    }
}
