//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/03/04.
//

import Foundation

struct Teller: TellerProvidable {
    
    let task: Task
    let semaphore: DispatchSemaphore
    
    init(task: Task) {
        self.task = task
        self.semaphore = DispatchSemaphore(value: Int(task.numberOfTeller))
    }
    
    func work() {
        Task.duration(of: task).sleep()
    }
    
    func report(waitingNumber: UInt, task: Task, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, task.rawValue, inProgress))
    }
    
}
