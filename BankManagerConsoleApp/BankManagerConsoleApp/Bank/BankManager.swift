//
//  BankManager.swift
//  Created by 미르, 희동.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let queue = Queue<CustomerNumbering>(queue: LinkedList<CustomerNumbering>())
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    private let dispatchQueue = DispatchQueue.global(qos: .utility)
    weak var delegate: ManageLabel?
    
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
            depositSemaphore.wait()
            recieve(customer: customer)
            depositSemaphore.signal()
        }
    }
    
    func assignLoan(customer: Customer, dispatchGroup: DispatchGroup) {
        dispatchQueue.async(group: dispatchGroup) {
            loanSemaphore.wait()
            recieve(customer: customer)
            loanSemaphore.signal()
        }
    }
    
    func recieve(customer: Customer) {
        delegate?.turn(customer: customer)
        paceTime(customer.banking?.pace ?? 0)
        delegate?.quit(customer: customer)
    }
    
    private func paceTime(_ pace: Double) {
        usleep(useconds_t(pace * 1000000))
    }
}
