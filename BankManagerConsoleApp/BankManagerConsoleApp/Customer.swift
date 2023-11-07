//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 전성수 on 11/1/23.
//

import Foundation

struct Customer: CustomStringConvertible {
    var description: String {
        "\(id)번 고객"
    }
    
    let id: Int
    let task: BankTask
    
    func runTask(group: DispatchGroup) {
        task.runTask(self, group: group)
    }
}

