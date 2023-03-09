//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/03/02.
//

import Foundation

class Customer: Node<String> {
    let purpose: BankingService?
    
    override init(_ data: String) {
        let bankServices = BankingService.allCases
        self.purpose = bankServices.randomElement()
        super.init(data)
    }
}
