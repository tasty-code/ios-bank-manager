//
//  Bankable.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/1/23.
//

import Foundation

protocol Bankable: AnyObject {
    var customerQueue: Queue<Customer> { get }
    var group: DispatchGroup { get }
    
    func beginTask() -> (taskProcessingTime: Double, handledCustomer: Int)
    
    func assignTask(_ customer: Customer, group: DispatchGroup)
}

extension Bankable {
    func assignTask(_ customer: Customer, group: DispatchGroup) {
        let task = customer.task
        let semaphore = type(of: task).semaphore
        let queue = type(of: task).dispatchQueue
        
        queue.async(group: group) {
            semaphore.wait()
            print(BankDialogue.start(customer, task: task))
            Thread.sleep(forTimeInterval: task.processingTime)
            print(BankDialogue.finish(customer, task: task))
            semaphore.signal()
        }
    }
}
