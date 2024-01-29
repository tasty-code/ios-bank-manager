//
//  BankManager.swift
//  Created by 미르, 희동.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let queue = Queue<CustomerNumbering>(queue: LinkedList<CustomerNumbering>())
    private let bankClerk = BankClerk()
    
    func standBy(customer: CustomerNumbering) {
        queue.enqueue(element: customer)
    }
    
    func assign() throws {
        while let list = try? queue.dequeue() {
            guard let customer = list as? Customer else {
                throw QueueError.dequeueError
            }
            bankClerk.recieve(customer: customer)
        }
    }
}
