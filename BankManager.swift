//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var totalCustomers: Int
    private var totalTime: Double
    
    private let banker: Banker = Banker()
    private let queue: Queue<Customer> = Queue(linkedList: LinkedList())
}
