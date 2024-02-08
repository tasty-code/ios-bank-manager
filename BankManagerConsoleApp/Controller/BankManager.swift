//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private(set) var employees: [Employee]
    
    init(employees: [Employee]) {
        self.employees = employees
    }
    
    func reportDeadlineSummary(with customerManager: CustomerManager, startTime bankingServiceStart: TimeInterval, endTime bankingServiceEnd: TimeInterval) {
        let totalTime = bankingServiceEnd - bankingServiceStart
        let convertedTotalTime = String(format: "%.2f", totalTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerManager.customerNumber)명이며, 총 업무시간은 \(convertedTotalTime) 입니다.")
    }
}
