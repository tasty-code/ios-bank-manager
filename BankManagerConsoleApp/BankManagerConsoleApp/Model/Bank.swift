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
                clerk.work(for: customer)
                count += 1
            }
        }
        
        let totalTime = caculateProcessingTime(startTime)
        print(BankMessage.result(count, totalTime).description)
    }
    
    func caculateProcessingTime(_ startTime: CFAbsoluteTime) -> String {
        let time = CFAbsoluteTimeGetCurrent() - startTime
        let flooredTime = floor(time * 10) / 10
        let totalTime = String(format: "%.2f", flooredTime)
        
        return totalTime
    }
}
