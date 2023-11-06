//
//  LoanTask.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/6/23.
//

import Foundation

struct LoanTask: BankTask {
    static let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    var name: String = "대출"
    var processingTime: Double = 1.1
}
