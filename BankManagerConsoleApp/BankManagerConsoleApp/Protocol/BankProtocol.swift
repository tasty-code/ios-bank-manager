//
//  BankProtocol.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/27.
//

import Foundation

typealias waitingNumber = UInt
typealias customerInfo = (number: waitingNumber, customer: Customer)

protocol BankProtocol {

    func open()
    func close()
    
    func working()
    func report(waitingNumber: UInt, inProgress: Bool)
}
