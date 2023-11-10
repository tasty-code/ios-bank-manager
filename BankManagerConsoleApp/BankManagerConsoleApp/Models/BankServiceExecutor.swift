//
//  ServiceWorker.swift
//  BankManagerConsoleApp
//
//  Created by Janine on 11/8/23.
//

import Foundation

struct BankServiceExecutor {
    private let queue: OperationQueue
    
    init(type: ServiceType) {
        self.queue = OperationQueue(name: type.description, maxConcurrentOperationCount: type.maxCount)
    }
    
    func work(_ task: BlockOperation) {
        queue.addOperation(task)
    }
    
    func wait() {
        queue.waitUntilAllOperationsAreFinished()
    }
}
