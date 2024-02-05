//
//  ConsoleView.swift
//  BankManagerConsoleApp
//
//  Created by nayeon  on 2024/02/01.
//

import Foundation

struct ConsoleView {
    static func showMenu() {
        print(BankMessage.open.show)
        print(BankMessage.exit.show)
    }
    
    static func showResult(customerCount: Int, intervalTime: String) {
        let resultMessage = BankMessage.result(customerCount, intervalTime)
        print(resultMessage.show)
    }
    
    static func showCustomerWorkStart(customerNumber: Int, workType: String) {
        let startMessage = BankMessage.start(customerNumber, workType)
        print(startMessage.show)
    }

    static func showCustomerWorkDone(customerNumber: Int, workType: String) {
        let doneMessage = BankMessage.done(customerNumber, workType)
        print(doneMessage.show)
    }
}
