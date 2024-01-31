//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 미르, 희동 on 1/29/24.
//

import Foundation

struct BankClerk {
    private var pace: Double = 0.7
    
    init(pace: Double = 0.7) {
            self.pace = pace
        }
    
    func recieve(customer: Customer) {
        print("\(customer.numOfPerson)번 고객 업무 시작")
        paceTime(pace)
        print("\(customer.numOfPerson)번 고객 업무 완료")
    }
    
    private func paceTime(_ pace: Double) {
        usleep(useconds_t(pace * 1000000))
    }
}
