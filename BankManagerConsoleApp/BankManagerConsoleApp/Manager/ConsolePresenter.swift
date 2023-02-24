//
//  ConsolePresenter.swift
//  BankManagerConsoleApp
//
//  Created by Bora Yang on 2023/02/24.
//

import Foundation

enum ConsolePresenter {
    static func startWorking(customerID: Int) {
        print("\(customerID)번 고객 업무 시작")
    }
    static func finishedWorking(customerID: Int) {
        print("\(customerID)번 고객 업무 완료")
    }
}
