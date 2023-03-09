//
//  BankerProtocol.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/22.
//

import Foundation

protocol BankerProtocol {

    func work(for customer: Customer)
    func workStart(of orderNumber: Int, for workType: String) -> String
    func workComplete(of orderNumber: Int, for workType: String) -> String
}

extension BankerProtocol {

    func workStart(of orderNumber: Int, for workType: String) -> String { "\(orderNumber)번 고객 \(workType)업무 시작" }

    func workComplete(of orderNumber: Int, for workType: String) -> String { "\(orderNumber)번 고객 \(workType)업무 완료" }
}

