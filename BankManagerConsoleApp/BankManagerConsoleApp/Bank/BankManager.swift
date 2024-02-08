//
//  BankManager.swift
//  Created by 미르, 희동.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let queue = Queue<CustomerNumbering>(queue: LinkedList<CustomerNumbering>())
    private let bankClerk: [Banking: BankClerk]
    private let semaphore = DispatchSemaphore(value: 2)
    private let dispatchQueue = DispatchQueue.global()
    
    init(bankClerk: [Banking : BankClerk]) {
        self.bankClerk = bankClerk
    }
    
    func standBy(customer: CustomerNumbering) {
        queue.enqueue(element: customer)
    }
    
    func stop() {
        queue.clear()
    }
    
    func assignBank(dispatchGroup: DispatchGroup) throws {
        while let list = try? queue.dequeue(), let banking = list.banking {
            guard let customer = list as? Customer else {
                throw QueueError.dequeueError
            }
            switch banking {
                case .deposit:
                assignDeposit(customer: customer, dispatchGroup: dispatchGroup)
                case .loan:
                assignLoan(customer: customer, dispatchGroup: dispatchGroup)
                }
            }
    }
    
    func assignDeposit(customer: Customer, dispatchGroup: DispatchGroup) {
        dispatchQueue.async(group: dispatchGroup) {
            semaphore.wait()
            recieve(customer: customer)
            semaphore.signal()
        }
    }
    
    func assignLoan(customer: Customer, dispatchGroup: DispatchGroup) {
        dispatchQueue.async(group: dispatchGroup) {
            recieve(customer: customer)
        }
    }
    
    func recieve(customer: Customer) {
        CFAbsoluteTimeGetCurrent()
        paceTime(customer.banking?.pace ?? 0)
        CFAbsoluteTimeGetCurrent()
    }
    
    private func paceTime(_ pace: Double) {
        usleep(useconds_t(pace * 1000000))
    }
}
