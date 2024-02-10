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
    private let bankLoanClerk: BankClerk
    private let bankDepositClerk: BankClerk
    weak var delegate: BankManagerDelegate?
    private var handledCustomerCount = 0
    private var loanClerkCount: Int
    private var depositClerkCount: Int
    private let group = DispatchGroup()
    
    init(loanClerksCount: Int, depositClerksCount: Int) {
        self.loanClerkCount = loanClerksCount
        self.depositClerkCount = depositClerksCount
        self.bankLoanClerk = BankClerk(workType: .loan)
        self.bankDepositClerk = BankClerk(workType: .deposit)
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
        serveCustomer(loanClerkCount, depositClerkCount)
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
            group.enter()
            switch customer.purpose {
            case .loan:
                handlePurpose(semaphore: loanSemaphore, customer: customer)
            case .deposit:
                handlePurpose(semaphore: depositSemaphore, customer: customer)
            }
            group.leave()
            handledCustomerCount += 1
        }
    }
    private func handlePurpose(semaphore: DispatchSemaphore, customer: Customer) {
        DispatchQueue.global().async(group: group) { [self] in
            semaphore.wait()
            manageWork(with: customer)
            semaphore.signal()
        }
    }
    
    private func manageWork(with customer: Customer) {
        DispatchQueue.global().sync {
            delegate?.showCustomerWorkStart(customerNumber: customer.number, workType: customer.purpose.name)
            bankLoanClerk.work(for: customer)
            delegate?.showCustomerWorkDone(customerNumber: customer.number, workType: customer.purpose.name)
        }
    }
}
