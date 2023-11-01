//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private var customerQueue = Queue<Customer>()
    private var userChoice: Int = 0
    var isStart: Bool {
        if userChoice == 1 {
            return true
        } else {
            return false
        }
    }
    
    func businessStart() {
        while true {
            print(BankDialogue.menu)
            print(BankDialogue.input, terminator: "")
            guard let input = readLine(), let number = Int(input) else {
                return
            }
            
            userChoice = number
            
            if isStart {
                taskBegin(customerCount: Int.random(in: 10...30))
            } else {
                break
            }
        }
    }
    
    private func taskBegin(customerCount: Int) {
        var taskProcessingTime: Double = 0
        var handledCustomer = 0
        
        configureQueue(1..<customerCount + 1)
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                break
            }
            print(BankDialogue.start(customer))
            taskProcessingTime += 0.7
            print(BankDialogue.finish(customer))
            handledCustomer += 1
        }
        
        print(BankDialogue.close(handledCustomer, workTime: taskProcessingTime))
    }
    
    private func configureQueue(_ range: Range<Int>) {
        for id in range {
            customerQueue.enqueue(Customer(id: id))
        }
    }
}
