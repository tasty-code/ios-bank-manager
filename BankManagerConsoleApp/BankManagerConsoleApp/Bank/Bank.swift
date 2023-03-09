//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by J.E on 2023/02/23.
//

import Foundation

struct Bank {
    private let clerks: [BankClerkProtocol]
    private let customers: Queue<String>
    private var numberOfCustomers: Int
    private let rangeOfNumberOfCustomers = (minimum: 10, maximum: 30)
    private var timer: Timer
    private let semaphore = DispatchSemaphore(value: 1)
    
    init(clerks: BankingService...) {
        self.customers = Queue<String>()
        self.clerks = Array(clerksPerType: clerks)
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
            customers.enqueue(customer)
        }
    }

    private func handleAllCustomers() {
        let serviceManager = ServiceAsynchronizer(queue: customers)
        let works = serviceManager.makeWorkGroup(by: clerks)
        works.wait()
    }
    
    mutating func close() {
        let totalSpentTime = timer.totalTime()
        printClosingMessage(with: totalSpentTime)
    }
    
    private func printClosingMessage(with totalSpentTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(totalSpentTime)초입니다.")
    }
}
