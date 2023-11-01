//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/1/23.
//

import Foundation

class Bank: Bankable {
    private var customerQueue = Queue<Customer>()
    
    func taskBegin(customerCount: Int) -> (taskProcessingTime: Double, handledCustomer: Int) {
        configureQueue(customerCount: customerCount)
        
        var taskProcessingTime: Double = 0
        var handledCustomer = 0
        
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                break
            }
            print(BankDialogue.start(customer))
            taskProcessingTime += 0.7
            print(BankDialogue.finish(customer))
            handledCustomer += 1
        }
        
        freeQueue()
        
        return (taskProcessingTime, handledCustomer)
    }
    
    private func configureQueue(customerCount: Int) {
        var queue = Queue<Customer>()
        for i in 1...customerCount {
            queue.enqueue(Customer(id: i))
        }
        customerQueue = queue
    }
    
    private func freeQueue() {
        customerQueue.clear()
    }
}
