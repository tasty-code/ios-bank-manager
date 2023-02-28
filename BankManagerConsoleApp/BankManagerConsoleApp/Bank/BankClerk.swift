//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/02/23.
//

import Foundation

struct BankClerk {
    private let timeSpent: useconds_t = 700000
    
    func serve(_ customer: Node<String>) {
        print("\(customer.data) 업무 시작")
        usleep(timeSpent)
        print("\(customer.data) 업무 완료")
    }
}
