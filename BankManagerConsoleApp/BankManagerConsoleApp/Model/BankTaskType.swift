//
//  BankTaskType.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 1/30/24.
//

enum BankTaskType {
    case deposit
    case loan
}

extension BankTaskType: CaseIterable {
    static var random: Self? {
        return allCases.randomElement()
    }
}
