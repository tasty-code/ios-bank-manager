//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/03/04.
//

import Foundation

struct Teller: TellerProtocol {
    
    
    func work() {
        Task.duration(of: .loan).sleep()
    }
    
    func report(waitingNumber: UInt, task: Task, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, task.rawValue, inProgress))
    }
    
}
