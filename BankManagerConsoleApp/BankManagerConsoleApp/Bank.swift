//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by J.E on 2023/02/23.
//

import Foundation

struct Bank {
    private let queue: Queue<String>
    private let clerks: [BankClerk]
    private var numberOfCustomers: Int = 0
    
    init() {
        self.queue = Queue<String>()
        self.clerks = [BankClerk()]
    }
    
    mutating func receive(numberOfCustomers: Int) {
        self.numberOfCustomers = numberOfCustomers
    }
    
    func lineUpCustomersInQueue() {
        (1...numberOfCustomers).forEach {
            let customer = "\($0)번 고객"
            let node = Node(customer)
            queue.enqueue(node)
        }
    }
    
    private func distributeCustomersToClerk() -> Node<String>? {
        let node = queue.dequeue()
        return node
    }
    
    func handleAllCustomers() {
        while !queue.isEmpty() {
            guard let customer = distributeCustomersToClerk() else { return }
            clerks[0].serve(customer: customer)
        }
        let totalTime = calculateTotalTime()
        BankManager.closingMessage(totalNumberOfCustomers: numberOfCustomers, totalTime: totalTime)
    }
    
    private func calculateTotalTime() -> Double {
        return Double(numberOfCustomers) * 0.7
    }
}
