//
//  BankerProtocol.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/22.
//

import Foundation

protocol BankerProtocol {

    static var processingTime: Double { get }

    func work(for currentCustomerNumber: Int)
    func workStart(_ orderNumber: Int) -> String
    func workComplete(_ orderNumber: Int) -> String
}

extension BankerProtocol {

    func work(for currentCustomerNumber: Int) {
        print(workStart(currentCustomerNumber))
        Thread.sleep(forTimeInterval: Banker.processingTime)
        print(workComplete(currentCustomerNumber))
    }

    func workStart(_ orderNumber: Int) -> String { "\(orderNumber)번 고객 업무 시작" }

    func workComplete(_ orderNumber: Int) -> String { "\(orderNumber)번 고객 업무 완료" }
}

