//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by Mason Kim on 2023/03/09.
//

import Foundation

struct Customer {
    let id: Int
    let workType: WorkType
    var timespent: TimeInterval { workType.timespent }
}
