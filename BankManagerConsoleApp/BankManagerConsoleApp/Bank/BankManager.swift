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
    
    func makeCustomerQueue(with customer: Int) {
        (1...customer).forEach {
            customerQueue.enqueue($0)
        }
    }
    
    func handleTask(completion: @escaping (Double) -> Void) {
        var totalDuration = 0.0
        
        while !customerQueue.isEmpty {
            guard let customerNumber = customerQueue.dequeue() else {
                return
            }
            updateTaskState?(.start(number: customerNumber))
            
            DispatchQueue.global().sync {
                Thread.sleep(forTimeInterval: duration)
                updateTaskState?(.finish(number: customerNumber))
                totalDuration += duration
            }
        }
        
        completion(totalDuration)
    }
}
