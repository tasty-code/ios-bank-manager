//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/22.
//

import Foundation

struct Banker: BankerProtocol {

    var processingTime: Double

    init(workType: WorkType) {
        switch workType {
        case .account:
            self.processingTime = WorkType.account.processingTime
        case .loan:
            self.processingTime = WorkType.loan.processingTime
        }
    }

    func work(for customer: Customer) {
        print(workStart(of: customer.waitingOrder, for: customer.workType))
        Thread.sleep(forTimeInterval: processingTime)
        print(workComplete(of: customer.waitingOrder, for: customer.workType))
    }
}
