//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/23.
//

import Foundation

struct Customer {
    private var id: Int
    private(set) var totalTime: TimeInterval

    init(id: Int, withTotalTime totalTime: TimeInterval) {
        self.id = id

        guard totalTime >= 0 else {
            self.totalTime = 0
            return
        }
        self.totalTime = totalTime
    }
}
