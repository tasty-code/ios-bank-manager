//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by ㅣ on 2/1/24.
//

import Foundation

enum BankService: String {

    case loan = "대출"
    case deposit = "예금"
    
    var requiredTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}

struct Customer {
    let number: Int
    let service: BankService
}
