//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jin-Mac on 1/30/24.
//

import Foundation

struct Bank {
    var depositWatingQueue = CustomerQueue<Customer>()
    var loanWatingQueue = CustomerQueue<Customer>()
    var depositClerkFirst: BankClerk
    var depositClerkSecond: BankClerk
    var loanClerkFirst: BankClerk
    var customerCount = 0
    let depositSemaphore = DispatchSemaphore(value: 2)
    let loanSemaphore = DispatchSemaphore(value: 1)
    let watingGroup = DispatchGroup()
    
    
    init(depositClerkFirst: BankClerk = BankClerk(),
         depositClerkSecond: BankClerk = BankClerk(),
         loanClerkFirst: BankClerk = BankClerk()) {
        self.depositClerkFirst = depositClerkFirst
        self.depositClerkSecond = depositClerkSecond
        self.loanClerkFirst = loanClerkFirst
    }
}

extension Bank {
    
    mutating func open() {
        setWatingLine()
        excuteBankWork()
    }
    
    private mutating func setWatingLine() {
        self.customerCount = Int.random(in: 10...30)
        
        for count in 1...customerCount {
            guard let task = Banking.allCases.randomElement() else { return }
            switch task {
            case .deposit:
                depositWatingQueue.enqueue(value: Customer(number: count, task: task))
            case .loan:
                loanWatingQueue.enqueue(value: Customer(number: count, task: task))
            }
        }
    }
    
    private mutating func workDepositFirst() {
        guard !depositWatingQueue.isEmpty() else { return }
        depositSemaphore.wait()
        DispatchQueue.global().async(group: watingGroup) { [self] in
            guard let customer = depositWatingQueue.dequeue() else { return }
            BankManager().sendWorkingMessage("\(BankMessage.start(customer.number, "예금").description)")
            depositClerkFirst.depositWorking()
            depositSemaphore.signal()
            BankManager().sendWorkingMessage("\(BankMessage.done(customer.number, "예금").description)")
        }
    }
    
    private mutating func workDepositSecond() {
        guard !depositWatingQueue.isEmpty() else { return }
        depositSemaphore.wait()
        DispatchQueue.global().async(group: watingGroup) { [self] in
            guard let customer = depositWatingQueue.dequeue() else { return }
            BankManager().sendWorkingMessage("\(BankMessage.start(customer.number, "예금").description)")
            depositClerkSecond.depositWorking()
            depositSemaphore.signal()
            BankManager().sendWorkingMessage("\(BankMessage.done(customer.number, "예금").description)")
        }
    }
    
    private mutating func workLoanFirst() {
        guard !loanWatingQueue.isEmpty() else { return }
        loanSemaphore.wait()
        DispatchQueue.global().async(group: watingGroup) { [self] in
            guard let customer = loanWatingQueue.dequeue() else { return }
            BankManager().sendWorkingMessage("\(BankMessage.start(customer.number, "대출").description)")
            loanClerkFirst.lendWorking()
            loanSemaphore.signal()
            BankManager().sendWorkingMessage("\(BankMessage.done(customer.number, "대출").description)")
        }
    }
    
    private mutating func excuteBankWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        while !depositWatingQueue.isEmpty() || !loanWatingQueue.isEmpty() {
            workDepositFirst()
            workDepositSecond()
            workLoanFirst()
        }

        watingGroup.wait()
        let totalTime = caculateProcessingTime(startTime)
        BankManager().sendWorkingMessage("\(BankMessage.result(customerCount, totalTime).description)")
        resetSetting()
    }
    
    private func resetSetting() {
        depositSemaphore.signal()
        loanSemaphore.signal()
    }
    
    private func caculateProcessingTime(_ startTime: CFAbsoluteTime) -> String {
        let time = CFAbsoluteTimeGetCurrent() - startTime
        let flooredTime = floor(time * 10) / 10
        let totalTime = String(format: "%.2f", flooredTime)
        
        return totalTime
    }
}
