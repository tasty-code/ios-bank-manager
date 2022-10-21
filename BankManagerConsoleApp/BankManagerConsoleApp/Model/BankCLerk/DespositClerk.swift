//
//  DespositClerk.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/21.
//

import Foundation

struct DespositClerk: BankClerk {
    var workType: WorkType
    
    func bankService(in client: Client) {
        print("\(client.waitNumber)번 고객 \(workType.description) 시작")
        Thread.sleep(forTimeInterval: client.workType.time)
        print("\(client.waitNumber)번 고객 \(workType.description) 종료")
    }
}
