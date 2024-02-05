//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

protocol BankManagerDelegate {
    func showResult(customerCount: Int, intervalTime: String)
    func showCustomerWorkStart(customerNumber: Int)
    func showCustomerWorkDone(customerNumber: Int)
}

struct Bank {
    private var loanWatingQueue = Queue<Customer>()
    private var depositWatingQueue = Queue<Customer>()
    
    private let bankLoanClerk: BankLoanClerk = BankLoanClerk()
    private let bankDepositClerk: BankDepositClerk = BankDepositClerk()
    
    private var handledCustomerCount = 0
    var delegate: BankManagerDelegate?
    
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

        delegate?.showResult(customerCount: handledCustomerCount, intervalTime: totalTime)
    }
    
    private mutating func serveCustomer() {
        while !bankWatingQueue.isEmpty() {
            guard let customer = bankWatingQueue.dequeue() else { return }
            delegate?.showCustomerWorkStart(customerNumber: customer.number)
            clerk.work(for: customer)
            delegate?.showCustomerWorkDone(customerNumber: customer.number)
            handledCustomerCount += 1
        }
    }
}
