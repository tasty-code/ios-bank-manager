//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/03/02.
//

import Foundation

enum Task: String, CaseIterable {
    
    case deposit = "예금"
    case loan = "대출"
    
    var numberOfTeller: UInt {
        switch self {
        case .deposit:
            return 1
        case .loan:
            return 1
        }
    }
}

extension Task {
    static func getRandomTask() -> Task {
        let tasks = Task.allCases
        guard let task = tasks.randomElement() else { return Task.deposit }
        return task
    }
    
    static func duration(of task: Task) -> Double {
        switch task {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    
}
