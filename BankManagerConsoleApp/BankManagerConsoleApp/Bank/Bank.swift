//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by J.E on 2023/02/23.
//

import Foundation

struct Bank {
    private let queue: Queue<String>
    private let clerks: [BankClerkForDeposit]
    private var numberOfCustomers: Int
    private let rangeOfNumberOfCustomers = (minimum: 10, maximum: 30)
    
    init(clerks: [BankClerkForDeposit]) {
        self.queue = Queue<String>()
        self.clerks = clerks
        self.numberOfCustomers = Int.random(in: rangeOfNumberOfCustomers.minimum...rangeOfNumberOfCustomers.maximum)
    }
    
    func open() {
        lineUpCustomersInQueue()
        handleAllCustomers()
    }
    
    private func lineUpCustomersInQueue() {
        (1...numberOfCustomers).forEach {
            let customer = Customer("\($0)번 고객")
            queue.enqueue(customer)
        }
    }
    
    private func extractCustomerFromQueue() -> Node<String>? {
        let node = queue.dequeue()
        return node
    }
    
    private func handleAllCustomers() {
        while !queue.isEmpty() {
            guard let customer = extractCustomerFromQueue() as? Customer else { return }
            clerks[0].serve(customer)
        }
    }
    
    func close() {
        let totalTime = calculateTotalTime()
        printClosingMessage(about: numberOfCustomers, with: totalTime)
    }
    
    private func calculateTotalTime() -> Double {
        return Double(numberOfCustomers) * 0.7
    }
    
    private func printClosingMessage(about totalNumberOfCustomers: Int, with totalConsumedTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumberOfCustomers)명이며, 총 업무시간은 \(totalConsumedTime)초입니다.")
    }
}
