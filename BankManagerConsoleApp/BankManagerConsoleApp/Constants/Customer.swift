//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by ㅣ on 2/1/24.
//

import Foundation

enum BankService {
    case deposit
    case loan
}

struct Customer {
    let number: Int
    let service: BankService
}
