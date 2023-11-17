//
//  ServiceWorker.swift
//  BankManagerConsoleApp
//
//  Created by Janine on 11/8/23.
//

import Foundation

final class BankServiceExecutor {
    private let queue: OperationQueue
    
    init(type: ServiceType) {
        self.queue = OperationQueue(name: type.description, maxConcurrentOperationCount: type.maxCount)
    }
    
    func work(_ task: BlockOperation) {
        if !task.isCancelled {
            queue.addOperation(task)
        }
    }
    
    func cancel() {
        queue.cancelAllOperations()
    }
    
    func notify(_ closure: @escaping () -> Void) {
        queue.addBarrierBlock(closure)
    }
}
