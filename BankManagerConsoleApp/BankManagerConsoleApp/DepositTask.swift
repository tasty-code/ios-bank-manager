//
//  DepositTask.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/6/23.
//

import Foundation

struct DepositTask: BankTask {
    static let semaphore: DispatchSemaphore = DispatchSemaphore(value: 2)
    let name: String = "예금"
    let processingTime: Double = 0.7
}
