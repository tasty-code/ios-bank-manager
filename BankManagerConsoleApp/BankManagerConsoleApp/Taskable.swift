//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

protocol Taskable {
    var name: String { get }
    init()
    func process()
}

import Foundation

struct Loan: Taskable {
    let name: String = "대출업무"
    
    private let duration: Double = 1.1
    
    func process() {
        Thread.sleep(forTimeInterval: self.duration)
    }
}

struct Deposit: Taskable {
    let name: String = "예금업무"
    
    private let duration: Double = 0.7
    
    func process() {
        Thread.sleep(forTimeInterval: self.duration)
    }
}
