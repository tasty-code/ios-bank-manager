//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/6/23.
//

import Foundation

protocol BankTask {
    static var semaphore: DispatchSemaphore { get }
    
    var name: String { get }
    var processingTime: Double { get }
    
    func runTask(_ customer: Customer)
}

extension BankTask {
    func runTask(_ customer: Customer) {
        let semaphore = type(of: self).semaphore
        semaphore.signal()
        print(BankDialogue.start(customer, task: self))
        Thread.sleep(forTimeInterval: processingTime)
        print(BankDialogue.finish(customer, task: self))
        semaphore.wait()
    }
}
