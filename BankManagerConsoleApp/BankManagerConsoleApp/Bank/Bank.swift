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
    private var waitingQueue = Queue<Customer>()
    private let bankLoanClerk: BankLoanClerk = BankLoanClerk()
    private let bankDepositClerk: BankDepositClerk = BankDepositClerk()
    weak var delegate: BankManagerDelegate?
    private var handledCustomerCount = 0
    private var loanClerksCount: Int
    private var depositClerksCount: Int
    private let group = DispatchGroup()
    
    init(loanClerksCount: Int, depositClerksCount: Int) {
        self.loanClerksCount = loanClerksCount
        self.depositClerksCount = depositClerksCount
    }
    
    func open() {
         setWaitingLine()
         executeBankWork()
     }
    
    private func setWaitingLine() {
        handledCustomerCount = 0
        for number in 1...Int.random(in: 10...30) {
            guard let work = BankWorkType.allCases.randomElement() else { return }
            self.waitingQueue.enqueue(item: Customer(number: number, purpose: work))
         }
    }
    
    private func executeBankWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        serveCustomer(depositClerksCount,loanClerksCount)
        group.wait()
        let intervalTime = CFAbsoluteTimeGetCurrent() - startTime
        let flooredDifference = floor(intervalTime * 10) / 10
        let totalTime = String(format: "%.2f", flooredDifference)
        self.delegate?.showResult(customerCount: self.handledCustomerCount, intervalTime: totalTime)
    }

    private func serveCustomer(_ loanClerksCount: Int, _ depositClerksCount: Int) {
        let depositSemaphore = DispatchSemaphore(value: depositClerksCount)
        let loanSemaphore = DispatchSemaphore(value: loanClerksCount)
        
        while let customer = self.waitingQueue.dequeue() {
            DispatchQueue.global().async(group: group) {
                switch customer.purpose {
                case .loan:
                    loanSemaphore.wait()
                    self.delegate?.showCustomerWorkStart(customerNumber: customer.number, workType: customer.purpose.name)
                    self.bankLoanClerk.work(for: customer)
                    self.delegate?.showCustomerWorkDone(customerNumber: customer.number, workType: customer.purpose.name)
                    loanSemaphore.signal()
                    
                case .deposit:
                    depositSemaphore.wait()
                    self.delegate?.showCustomerWorkStart(customerNumber: customer.number, workType: customer.purpose.name)
                    self.bankDepositClerk.work(for: customer)
                    self.delegate?.showCustomerWorkDone(customerNumber: customer.number, workType: customer.purpose.name)
                    depositSemaphore.signal()
                }
            }
            handledCustomerCount += 1
        }
    }
}
