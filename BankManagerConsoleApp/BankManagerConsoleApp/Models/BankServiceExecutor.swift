//
//  ServiceWorker.swift
//  BankManagerConsoleApp
//
//  Created by Janine on 11/8/23.
//

import Foundation

final class BankServiceExecutor {
    private let semaphore: DispatchSemaphore
    
    init(type: ServiceType) {
        self.semaphore = DispatchSemaphore(value: type.maxCount)
    }
    
    func work(_ task: () -> Void) {
        semaphore.wait()
        task()
        semaphore.signal()
    }
}
