//
//  Deposit.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 2/1/24.
//

import Foundation

struct Deposit: Task {
    let name: String = "예금업무"
    
    private let duration: Double = 0.7
    
    func process() {
        Thread.sleep(forTimeInterval: self.duration)
    }
}
