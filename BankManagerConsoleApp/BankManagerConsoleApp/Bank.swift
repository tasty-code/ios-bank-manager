//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

struct Bank {
    private var bankWatingQueue = Queue<Customer>()
    private let clerk: WorkAble
    private var handledCustomerCount = 0
    
    init(clerk: WorkAble) {
        self.clerk = clerk
    }
    
    private mutating func setWaitingLine() {
        handledCustomerCount = 0
        for number in 1...Int.random(in: 10...30) {
            bankWatingQueue.enqueue(item: Customer(number: number))
        }
    }
    
    mutating func open() {
        setWaitingLine()
        executeBankWork()
    }
    
    private mutating func executeBankWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        DispatchQueue.global().sync {
            serveCustomer()
        }
        
        let intervalTime = CFAbsoluteTimeGetCurrent() - startTime
        let flooredDifference = floor(intervalTime * 10) / 10
        let resultDescription = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f입니다."
        let resultMessage = String(format: resultDescription, handledCustomerCount, flooredDifference)
        
        print(resultMessage)
    }
    
    private mutating func serveCustomer() {
        while !bankWatingQueue.isEmpty() {
            guard let customer = bankWatingQueue.dequeue() else { return }
            handledCustomerCount += 1
            clerk.work(for: customer)
        }
    }
}
