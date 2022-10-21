//
//  LoanClerk.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/21.
//

import Foundation

struct LoanClerk: BankClerk {
    var count: Int = 0
    
    func bankService(in client: Client) {
        print("\(client.waitNumber)번 고객 \(client.workType.description) 시작")
        Thread.sleep(forTimeInterval: client.workType.time)
        print("\(client.waitNumber)번 고객 \(client.workType.description) 종료")
    }
}
