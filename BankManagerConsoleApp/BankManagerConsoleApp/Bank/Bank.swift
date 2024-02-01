//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

struct Bank {
    private var bankWatingQueue = Queue<Customer>()
    private let clerk: BankWork
    private var handledCustomerCount = 0
    
    init(clerk: BankWork) {
        self.clerk = clerk
    }
    
    mutating func open() {
        setWaitingLine()
        executeBankWork()
    }
    
    private mutating func setWaitingLine() {
        handledCustomerCount = 0
        for number in 1...Int.random(in: 10...30) {
            bankWatingQueue.enqueue(item: Customer(number: number))
        }
    }
    
    private mutating func executeBankWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        DispatchQueue.global().sync {
            serveCustomer()
        }
        
        let intervalTime = CFAbsoluteTimeGetCurrent() - startTime
        let flooredDifference = floor(intervalTime * 10) / 10
        let totalTime = String(format: "%.2f", flooredDifference)
        ConsoleView.showResult(customerCount: handledCustomerCount, intervalTime: totalTime)
    }
    
    private mutating func serveCustomer() {
        while !bankWatingQueue.isEmpty() {
            guard let customer = bankWatingQueue.dequeue() else { return }
            ConsoleView.showCustomerWorkStart(customerNumber: customer.number)
            clerk.work(for: customer)
            ConsoleView.showCustomerWorkDone(customerNumber: customer.number)
            handledCustomerCount += 1
        }
    }
}
