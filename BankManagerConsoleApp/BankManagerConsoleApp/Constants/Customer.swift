//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by ㅣ on 2/1/24.
//

import Foundation

struct Customer {
    let number: Int
    let service: BankService
    
    init(number: Int, service: BankService) {
        self.number = number
        self.service = service
    }
}
