//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jin-Mac on 1/30/24.
//

import Foundation

struct Bank {
    var bankWatingQueue = CustomerQueue<Customer>()
    var clerk: BankClerk
    
    init(clerk: BankClerk = BankClerk()) {
        self.clerk = clerk
    }
    
    mutating func open() {
        setWatingLine()
        excuteBankWork()
    }
    
    private mutating func setWatingLine() {
        let customerCount: Int = Int.random(in: 10...30)
        
        for count in 1...customerCount {
            bankWatingQueue.enqueue(value: Customer(number: count))
        }
    }
    
    private mutating func excuteBankWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        var count = 0
        
        DispatchQueue.global().sync {
            while !bankWatingQueue.isEmpty() {
                guard let customer = bankWatingQueue.dequeue() else { return }
                print("\(customer.number)번 고객 업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("\(customer.number)번 고객 업무 완료")
                count += 1
            }
        }
        
        let time = CFAbsoluteTimeGetCurrent() - startTime
        let flooredTime = floor(time * 10) / 10
        let totalTime = String(format: "%.2f", flooredTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(count)명이며, 총 업무시간은 \(totalTime)초 입니다.")
    }
}
