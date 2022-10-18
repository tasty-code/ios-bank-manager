//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/17.
//

import Foundation

struct BankClerk {
    
    mutating func bankService(for client: Client) {
        print("\(client.waitNumber) 번 고객 업무시작")
        print("\(client.waitNumber) 번 고객 업무종료")
    }
}
