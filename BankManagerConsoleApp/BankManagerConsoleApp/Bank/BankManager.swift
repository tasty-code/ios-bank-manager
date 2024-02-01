//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class BankManager {
    var updateTaskState: ((TaskState) -> Void)?
    
    private var customerQueue = Queue<Int>()
    private let duration = 0.7
}

// MARK: - Methods
extension BankManager {
    
    func makeCustomerQueue(with customerCount: Int) async {
        for index in 1...customerCount {
            await customerQueue.enqueue(index)
        }
    }
    
    func handleTask(completion: @escaping (Double) -> Void) async {
        var totalDuration = 0.0
        
        while let customerNumber = await customerQueue.dequeue() {
            updateTaskState?(.start(number: customerNumber))
            Thread.sleep(forTimeInterval: duration)
            updateTaskState?(.finish(number: customerNumber))
            totalDuration += duration
        }
        
        completion(totalDuration)
    }
}
