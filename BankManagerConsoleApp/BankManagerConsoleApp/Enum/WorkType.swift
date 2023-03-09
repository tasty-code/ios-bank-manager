//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by 이상윤 on 2023/03/07.
//

import Foundation

enum WorkType: CaseIterable, CustomStringConvertible {

    case account
    case loan

    var description: String {
        switch self {
        case .account:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
