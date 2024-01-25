//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
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
        var totalDuration = Double(count) * duration
        makeCustomerQueue(with: count)
        proccessTask(with: count)
        return totalDuration
    }
    
    /// 손님 줄세우기
    func makeCustomerQueue(with customer: Int) {
        for number in 1...customer {
            customerQueue.enqueue(number)
        }
    }
    
    /// 업무 처리하기
    func proccessTask(with customer: Int) {
        for number in 1...customer {

            updateCustomerNumber?(number)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [weak self] in
                guard let self = self else { return }
                if let num = customerQueue.dequeue() {
                    updateCustomerNumber?(num)
                }
            }
        }
    }
}
