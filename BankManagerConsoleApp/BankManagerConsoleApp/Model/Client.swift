//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 김예준 on 11/2/23.
//

import Foundation

struct Client: CustomStringConvertible {
    private let id: Int
    private let spendTime: Double
    
    init(id: Int, spendTime: Double) {
        self.id = id
        self.spendTime = spendTime
    }
    
    var description: String {
        "\(self.id)번 고객"
    }
}
