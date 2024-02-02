//
//  Factory.swift
//  BankManagerConsoleApp
//
//  Created by ㅣ on 2/1/24.
//

import Foundation

struct MemberFactory {
    
    static func makeCustomers(count: Int) -> [Customer] {
        var customers = [Customer]()
        for number in 1...count {
            let service: BankService = Bool.random() ? .deposit : .loan
            let customer = Customer(number: number, service: service)
            customers.append(customer)
        }
        return customers
    }
}
