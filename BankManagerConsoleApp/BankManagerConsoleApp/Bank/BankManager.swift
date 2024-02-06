//
//  BankManager.swift
//  Created by 미르, 희동.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let queue = Queue<CustomerNumbering>(queue: LinkedList<CustomerNumbering>())
    private let bankClerk: [Banking: BankClerk]
    private let dispatchgroup = DispatchGroup()
    private let semaphore = DispatchSemaphore(value: 2)
    private let loanQueue = DispatchQueue(label: "loanQueue")
    private let depositQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
    
    init(bankClerk: [Banking : BankClerk]) {
        self.bankClerk = bankClerk
    }
    
    func standBy(customer: CustomerNumbering) {
        queue.enqueue(element: customer)
    }
    
    func stop() {
        queue.clear()
    }
    
    func assignBank() throws {
        while let list = try? queue.dequeue(), let banking = list.banking {
            guard let customer = list as? Customer else {
                throw QueueError.dequeueError
            }
            switch banking {
                case .deposit:
                    assignDeposit(customer: customer)
                case .loan:
                    assignLoan(customer: customer)
                }
            }
        dispatchgroup.wait()
    }
    
    func assignDeposit(customer: Customer) {
        depositQueue.async(group: dispatchgroup) {
            semaphore.wait()
            bankClerk[.deposit]?.recieve(customer: customer)
            semaphore.signal()
        }
    }
    
    func assignLoan(customer: Customer) {
        loanQueue.async(group: dispatchgroup) {
            bankClerk[.loan]?.recieve(customer: customer)
        }
    }
}
