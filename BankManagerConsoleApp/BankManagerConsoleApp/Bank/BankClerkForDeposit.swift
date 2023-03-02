//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/02/23.
//

import Foundation

private protocol BankClerkProtocol {
    var timeSpent: useconds_t { get }
    func serve(_ customer: Node<String>)
}

struct BankClerkForDeposit: BankClerkProtocol {
    fileprivate let timeSpent: useconds_t = 700000
    
    func serve(_ customer: Node<String>) {
        print("\(customer.data) 예금 업무 시작")
        usleep(timeSpent)
        print("\(customer.data) 예금 업무 완료")
    }
}

struct BankClerkForLoan: BankClerkProtocol {
    fileprivate let timeSpent: useconds_t = 1100000
    
    func serve(_ customer: Node<String>) {
        print("\(customer.data) 대출 업무 시작")
        usleep(timeSpent)
        print("\(customer.data) 대출 업무 완료")
    }
}
