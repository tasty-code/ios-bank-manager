//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/23.
//

import Foundation

struct Customer {
    let id: Int
    let workType: WorkType
    var timespent: TimeInterval { workType.timespent }
}
