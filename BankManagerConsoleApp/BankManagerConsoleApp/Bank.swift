//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by J.E on 2023/02/23.
//

import Foundation

struct Bank {
    let queue: Queue<String>
    var clerk: BankClerk
    var numberOfCustomers: Int = 0
    
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
    
    func distributeCustomersToClerk() -> Node<String>? {
        let node = queue.dequeue()
        return node
    }
    
    func handleAllCustomers() {
        while !queue.isEmpty() {
            guard let customer = distributeCustomersToClerk() else { return }
            clerk.serve(customer: customer)
        }
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(Double(numberOfCustomers) * 0.7)초입니다.")
    }
}
