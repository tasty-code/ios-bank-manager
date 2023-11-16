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
    
    var workable: Bool = true
    let id: Int
    let task: BankTask
}

