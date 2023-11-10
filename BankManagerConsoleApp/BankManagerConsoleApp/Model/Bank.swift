//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김예준 on 11/2/23.
//

import Foundation

struct Bank {
    private let bankManager: BankManagable

    private var totalWorkTime: String {
        String(format: "%.2f", self.bankManager.getTotalWorkTime())
    }
    
    init(bankManager: BankManagable) {
        self.bankManager = bankManager
    }
    
    func proceedBanking(clientCount: Int) {
        self.beginReception(count: clientCount)
        self.bankManager.startWork()
        print(CompleteTask.bankSettlementMassage(count: clientCount, totalWorkTime: self.totalWorkTime))
    }
    
    private func beginReception(count: Int) {
        for i in 1...count {
            guard let taskType = TaskType.allCases.randomElement() else { return }
            let client = Client(id: i, taskType: taskType)
            self.bankManager.recept(for: client)
        }
    }
}

extension Bank {
    private enum CompleteTask: CustomStringConvertible {
        case bankSettlementMassage(count: Int, totalWorkTime: String)
        
        var description: String {
            switch self {
            case .bankSettlementMassage(let count, let totalWorkTime):
                return "업무가 마감되었습니다. 오늘 엄무를 처리한 고객은 총 \(count)명이며, 총 업무시간은 \(totalWorkTime) 입니다."
            }
        }
    }
}
