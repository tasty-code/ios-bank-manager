//
//  Constants.swift
//  BankManagerConsoleApp
//
//  Created by 신동오 on 2023/02/24.
//

import Foundation

enum Constants {
    static let tellerProcessingTime: [BankingType: UInt32] = [.loan: 1100000, .deposit: 700000]
    static let tellerStaffing: [BankingType: Int] = [.loan: 1, .deposit: 2]
    static let rangeOfClients = 10...30
}
