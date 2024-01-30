//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

struct Client<TaskType: Task> {
    let number: Int
    let task: TaskType
}

protocol Task {
    var name: String { get }
    func process()
}

import Foundation

struct Loan: Task {
    var name: String = "대출업무"
    
    private let duration: Double = 1.1
    
    func process() {
        Thread.sleep(forTimeInterval: self.duration)
    }
}

struct Deposit: Task {
    var name: String = "예금업무"
    
    private let duration: Double = 0.7
    
    func process() {
        Thread.sleep(forTimeInterval: self.duration)
    }
}
