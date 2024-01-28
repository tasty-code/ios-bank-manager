//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

struct Bank {
    private var bankTellerQueue = BankTellerQueue<Customer>()
    private let clerk = BankClerk()
    private var handledCustomerCount = 0
    
    mutating func setWaitingLine(customer: Customer) {
        for numbers in 1...customer.number {
            bankTellerQueue.enqueue(item: customer)
        }
    }
    
    private mutating func executeBankWork(){
        let startTime = CFAbsoluteTimeGetCurrent()
        
        while !bankTellerQueue.isEmpty() {
            guard let customer = bankTellerQueue.dequeue() else { return }
            handledCustomerCount += 1
            clerk.work(for: customer)
        }
        
        let intervalTime = CFAbsoluteTimeGetCurrent() - startTime
        let flooredDifference = floor(intervalTime * 10) / 10
        let resultDescription = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f입니다."
        let resultMessage = String(format: resultDescription, handledCustomerCount, flooredDifference)
        
        print(resultMessage)
    }
    
    func isClosingBank() -> Bool {
        // 프롬포트에 2번 누르고, 큐에 맴버가 없을때
        if true {
            return true
        }
        return false
    }
    
    
}
