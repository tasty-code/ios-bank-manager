//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 1/31/24.
//

import Foundation

final class Banker {
    let taskType: TaskType
    var duration: Double
    
    init(taskType: TaskType) {
        self.taskType = taskType
        self.duration = taskType.taskTime
    }
    
    func processCustomer(_ customer: Customer) -> Double {
            Messages.taskStart(number: customer.number, taskType: taskType.description).printMessage()
            Thread.sleep(forTimeInterval: duration)
            Messages.taskDone(number: customer.number, taskType: taskType.description).printMessage()
            return duration
    }
}
