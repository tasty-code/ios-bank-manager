//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let queue = Queue<Customer>(queue: LinkedList<Customer>())
    
    func standBy(customer: Customer) {
        queue.enqueue(element: customer)
    }
}
