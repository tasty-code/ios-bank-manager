//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var customerManager: CustomerManager = CustomerManager()
    private var employees: [Employee] = []
    
    func reportDeadlineSummary(with customerManager: CustomerManager) {
        var totalTaskTime: Double { Double(customerManager.customers.count * 700) / 1000}
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerManager.customers.count)명이며, 총 업무시간은 \(totalTaskTime)초 입니다.")
    }
    
    mutating func createEmployee() {
        employees.append(Employee())
    }
    
    func handleCustomerTasks(with customerManager: CustomerManager) {
        employees[0].handleCustomerTasks(with: customerManager.ticketMachine)
    }
}
