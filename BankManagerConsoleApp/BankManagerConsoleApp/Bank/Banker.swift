//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 1/31/24.
//

import Foundation

final class Banker {

    func processCustomer(_ customer: Customer) {
        Messages.taskStart(number: customer.number, taskType: customer.taskType.description).printMessage()
        Thread.sleep(forTimeInterval: customer.taskType.taskTime)
        Messages.taskDone(number: customer.number, taskType: customer.taskType.description).printMessage()
    }
}
