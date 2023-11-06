//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

struct Customer {
    let ticketNumber: Int
    let serviceType: ServiceType
    
    init(ticketNumber: Int) {
        self.ticketNumber = ticketNumber
        self.serviceType = ServiceType.allCases.randomElement() ?? .deposit
    }
}
