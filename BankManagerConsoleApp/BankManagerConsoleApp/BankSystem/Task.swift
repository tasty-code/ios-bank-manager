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
            return 2
        case .loan:
            return 1
        }
    }
    
}

extension Task {
    
    static func randomTask() -> Task {
        let randomIndex = Int.random(in: 0..<Task.allCases.count)
        let randomTask = Task.allCases[randomIndex]
        
        return randomTask
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
