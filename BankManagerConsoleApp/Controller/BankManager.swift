//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var customerManager: CustomerManager = CustomerManager()
    var 은행원1: DispatchQueue?
    var 은행원2: DispatchQueue?
    var 은행원3: DispatchQueue?
    
    init() { }
    
    func reportDeadlineSummary(with customerManager: CustomerManager) {
    }
    
    mutating func createEmployees() {
        은행원1 = DispatchQueue(label: "대출1", attributes: .concurrent)
        은행원2 = DispatchQueue(label: "예금1", attributes: .concurrent)
        은행원3 = DispatchQueue(label: "예금2", attributes: .concurrent)
    }
}
