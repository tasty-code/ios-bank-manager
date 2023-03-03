//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by J.E on 2023/02/23.
//

import Foundation

struct Bank {
    private let queue: Queue<String>
    private let clerksForDeposit: [BankClerkForDeposit]
    private let clerksForLoan: [BankClerkForLoan]
    private var numberOfCustomers: Int
    private let rangeOfNumberOfCustomers = (minimum: 10, maximum: 30)
    private var timer: Timer
    private let semaphore = DispatchSemaphore(value: 1)
    
    init(numberOfClerksForDeposit: Int, numberOfClerksForLoan: Int) {
        self.queue = Queue<String>()
        self.clerksForDeposit = Array(repeating: BankClerkForDeposit(), count: numberOfClerksForDeposit)
        self.clerksForLoan = Array(repeating: BankClerkForLoan(), count: numberOfClerksForLoan)
        self.numberOfCustomers = Int.random(in: rangeOfNumberOfCustomers.minimum...rangeOfNumberOfCustomers.maximum)
        self.timer = Timer()
    }
    
    mutating func open() {
        timer.start()
        lineUpCustomersInQueue()
        handleAllCustomers()
        timer.finish()
    }
    
    private func lineUpCustomersInQueue() {
        (1...numberOfCustomers).forEach {
            let customer = Customer("\($0)번 고객")
            queue.enqueue(customer)
        }
    }
    
    private func makeWorkItem(for service: BankingService, by index: Int = 0) -> DispatchWorkItem {
        var clerk: BankClerkProtocol
        switch service {
        case .deposit: clerk = clerksForDeposit[safe: index]!
        case .loan: clerk = clerksForLoan[safe: index]!
        }
        let workItem = DispatchWorkItem {
            while !queue.isEmpty() {
                guard (queue.peekFirst() as? Customer)?.purposeOfVisit == service else { continue }
                
                semaphore.wait()
                guard let customer = extractCustomerFromQueue() as? Customer else { semaphore.signal(); return }
                semaphore.signal()
                
                clerk.serve(customer)
            }
        }
        return workItem
    }

    private func extractCustomerFromQueue() -> Node<String>? {
        let node = queue.dequeue()
        return node
    }
    
    private func handleAllCustomers() {
        let tasks = DispatchGroup()
        
        let task1 = makeWorkItem(for: .deposit)
        let task2 = makeWorkItem(for: .deposit, by: 1)
        let task3 = makeWorkItem(for: .loan)
        
        
        DispatchQueue.global().async(group: tasks, execute: task1)
        DispatchQueue.global().async(group: tasks, execute: task2)
        DispatchQueue.global().async(group: tasks, execute: task3)

        tasks.wait()
    }
    
    mutating func close() {
        let totalSpentTime = timer.sum()
        printClosingMessage(with: totalSpentTime)
    }
    
    private func printClosingMessage(with totalSpentTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(totalSpentTime)초입니다.")
    }
}
