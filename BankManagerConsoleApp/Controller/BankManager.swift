//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var loan: DispatchQueue?
    var deposit_task1: DispatchQueue?
    var deposit_task2: DispatchQueue?
    var employee_loan: Employee?
    var employee_deposit1: Employee?
    var employee_deposit2: Employee?
    
    init() { }
    
    func reportDeadlineSummary(with customerManager: CustomerManager, startTime bankingServiceStart: TimeInterval, endTime bankingServiceEnd: TimeInterval) {
        let totalTime = bankingServiceEnd - bankingServiceStart
        let convertedTotalTime = String(format: "%.2f", totalTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerManager.customers.count)명이며, 총 업무시간은 \(convertedTotalTime) 입니다.")
    }
    
    mutating func createEmployees() {
        loan = DispatchQueue(label: "대출1", attributes: .concurrent)
        deposit_task1 = DispatchQueue(label: "예금1", attributes: .concurrent)
        deposit_task2 = DispatchQueue(label: "예금2", attributes: .concurrent)
    }
}
