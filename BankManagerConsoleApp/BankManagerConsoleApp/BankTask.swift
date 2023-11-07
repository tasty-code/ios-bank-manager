//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/6/23.
//

import Foundation

protocol BankTask {
    static var semaphore: DispatchSemaphore { get }
    static var dispatchQueue: DispatchQueue { get }
    
    var name: String { get }
    var processingTime: Double { get }
    
    init()
    
    func runTask(_ customer: Customer, group: DispatchGroup)
}

extension BankTask {
    func runTask(_ customer: Customer, group: DispatchGroup) {
        let semaphore = type(of: self).semaphore
        let queue = type(of: self).dispatchQueue
        queue.async(group: group) {
            semaphore.wait()
            print(BankDialogue.start(customer, task: self))
            Thread.sleep(forTimeInterval: processingTime)
            print(BankDialogue.finish(customer, task: self))
            semaphore.signal()
        }
    }
}
