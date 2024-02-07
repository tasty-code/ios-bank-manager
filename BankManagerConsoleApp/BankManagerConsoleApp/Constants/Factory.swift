//
//  Factory.swift
//  BankManagerConsoleApp
//
//  Created by ㅣ on 2/1/24.
//

import Foundation

struct MemberFactory {
    
    static func makeCustomers(count: Int) -> [Customer] {
        let services = (1...count).map { _ in BankService.allCases.randomElement() ?? .deposit }
        let customers = services.enumerated().map { Customer(number: $0.offset + 1, service: $0.element) }
        
        return customers
    }
}
