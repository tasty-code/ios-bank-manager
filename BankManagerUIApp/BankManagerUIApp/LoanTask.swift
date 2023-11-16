//
//  LoanTask.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/6/23.
//

import Foundation

struct LoanTask: BankTask {
    static let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    static let dispatchQueue: DispatchQueue = DispatchQueue(label: "LoanQueue",qos: .utility, attributes: .concurrent)
    let name: String = "대출"
    let processingTime: Double = 1.1
}
