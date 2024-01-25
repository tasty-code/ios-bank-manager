//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class BankManager {
    
    var updateCustomerNumber: ((Int) -> Void)?
    
    private var customerQueue = Queue<Int>()
    private let duration = 0.7

}

// MARK: - Methods
extension BankManager {
    
    /// 은행원 업무 (총 업무시간 리턴)
    func handleTask(with count: Int) -> Double {
        let totalDuration = Double(count) * duration
        makeCustomerQueue(with: count)
        proccessTask(with: count)
        return totalDuration
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
            
            self.updateCustomerNumber?($0)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self.completeTask()
            }
        }
    }
    
    private func completeTask() {
        if let number = self.customerQueue.dequeue() {
            self.updateCustomerNumber?(number)
        }
    }
}
