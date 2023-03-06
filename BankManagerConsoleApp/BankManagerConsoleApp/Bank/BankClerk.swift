//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/02/23.
//

import Foundation

protocol BankClerkProtocol {
    var service: BankingService { get }
    func serve(_ customer: Customer)
}

extension BankClerkProtocol {
    func serve(_ customer: Customer) {
        guard let purposeOfVisit = customer.purposeOfVisit else { return }
        print("\(customer.data) \(purposeOfVisit.title) 업무 시작")
        Thread.sleep(forTimeInterval: purposeOfVisit.timeSpent)
        print("\(customer.data) \(purposeOfVisit.title) 업무 완료")
    }
}

struct BankClerkForDeposit: BankClerkProtocol {
    let service: BankingService = .deposit()
}

struct BankClerkForLoan: BankClerkProtocol {
    let service: BankingService = .loan()
}
