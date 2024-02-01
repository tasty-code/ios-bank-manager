//
//  Loan.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 2/1/24.
//

import Foundation

struct Loan: Task {
    let name: String = "대출업무"
    
    private let duration: Double = 1.1
    
    func process() {
        Thread.sleep(forTimeInterval: self.duration)
    }
}
