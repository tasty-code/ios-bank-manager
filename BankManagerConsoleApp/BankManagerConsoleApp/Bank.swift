//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

struct Bank {
    private var bankWatingQueue = Queue<Customer>()
    private let clerk = BankClerk()
    private var handledCustomerCount = 0
    
    private mutating func setWaitingLine() -> Int {
        for number in 1...Int.random(in: 10...30) {
            bankWatingQueue.enqueue(item: Customer(number: number))
        }
        return bankWatingQueue.count
    }
    
    mutating func executeBankWork(){
        let startTime = CFAbsoluteTimeGetCurrent()
        
        let _ = setWaitingLine()
        
        while !bankWatingQueue.isEmpty() {
            guard let customer = bankWatingQueue.dequeue() else { return }
            handledCustomerCount += 1
            clerk.work(for: customer)
        }
        
        let intervalTime = CFAbsoluteTimeGetCurrent() - startTime
        let flooredDifference = floor(intervalTime * 10) / 10
        let resultDescription = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f입니다."
        let resultMessage = String(format: resultDescription, handledCustomerCount, flooredDifference)
        
        print(resultMessage)
    }
    
    func closeBank() -> Bool {
        if bankWatingQueue.isEmpty() {
            return true
        }
        return false
    }
}
