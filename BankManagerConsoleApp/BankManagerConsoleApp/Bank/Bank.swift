//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

protocol BankManagerDelegate: AnyObject {
    func showResult(customerCount: Int, intervalTime: String)
    func showCustomerWorkStart(customerNumber: Int, workType: String)
    func showCustomerWorkDone(customerNumber: Int, workType: String)
}

final class Bank {
    private var loanWatingQueue = Queue<Customer>()
    private var depositWatingQueue = Queue<Customer>()
    private let bankLoanClerk: BankLoanClerk = BankLoanClerk()
    private let bankDepositClerk: BankDepositClerk = BankDepositClerk()
    private var handledCustomerCount = 0
    weak var delegate: BankManagerDelegate?
    var group = DispatchGroup()
    
    func open() {
         setWaitingLine()
         executeBankWork()
     }
    
    private func setWaitingLine() {
        handledCustomerCount = 0
        for number in 1...Int.random(in: 10...30) {
            guard let work = BankWorkType.allCases.randomElement() else { return }
            switch work {
            case .deposit:
                depositWatingQueue.enqueue(item:  Customer(number: number, purpose: .deposit))
            case .loan:
                loanWatingQueue.enqueue(item:  Customer(number: number, purpose: .loan))
            }
        }
    }
    
    private func executeBankWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group, execute: serveLoanCustomer)
        DispatchQueue.global().async(group: group, execute: serveDepositCustomer)
        
        group.notify(queue: .global()) {
            print("작업 끝")
            let intervalTime = CFAbsoluteTimeGetCurrent() - startTime
            let flooredDifference = floor(intervalTime * 10) / 10
            let totalTime = String(format: "%.2f", flooredDifference)
            self.delegate?.showResult(customerCount: self.handledCustomerCount, intervalTime: totalTime)
        }
        
    }
    
    private func serveLoanCustomer() {
        while !loanWatingQueue.isEmpty() {
            guard let customer = loanWatingQueue.dequeue() else { return }
            delegate?.showCustomerWorkStart(customerNumber: customer.number, workType: BankWorkType.deposit.name)
            bankLoanClerk.work(for: customer)
            delegate?.showCustomerWorkDone(customerNumber: customer.number, workType:  BankWorkType.deposit.name)
            handledCustomerCount += 1
        }
    }

    private func serveDepositCustomer() {
        while !depositWatingQueue.isEmpty() {
            guard let customer = depositWatingQueue.dequeue() else { return }
            delegate?.showCustomerWorkStart(customerNumber: customer.number, workType: BankWorkType.loan.name)
            bankDepositClerk.work(for: customer)
            delegate?.showCustomerWorkDone(customerNumber: customer.number, workType: BankWorkType.loan.name)
            handledCustomerCount += 1
        }
    }
}
