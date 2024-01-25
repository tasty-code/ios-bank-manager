//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class BankManager {

    var updateCustomerNumber: ((TaskState) -> Void)?
    
    private var customerQueue = Queue<Int>()
    private let duration = 0.7
    private var totalDuration = 0.0

}

// MARK: - Methods
extension BankManager {
    
    /// 은행원 업무 (총 업무시간 리턴)
    func handleTask(with count: Int, completion: @escaping (Double) -> Void) {
        makeCustomerQueue(with: count)
        proccessTask(with: count)
        completion(totalDuration)
    }
    
    /// 손님 줄세우기
    private func makeCustomerQueue(with customer: Int) {
        (1...customer).forEach {
            customerQueue.enqueue($0)
        }
    }
    
    /// 업무 처리하기
    private func proccessTask(with customer: Int) {
        
        (1...customer).forEach { [weak self] in
            guard let self = self else { return }
            
            self.updateCustomerNumber?(.start(number: $0))
            DispatchQueue.global().sync {
                Thread.sleep(forTimeInterval: duration)
                self.completeTask()
                totalDuration += duration
            }
        }
    }
    
    private func completeTask() {
        if let number = customerQueue.dequeue() {
            updateCustomerNumber?(.finish(number: number))
        }
    }
}
