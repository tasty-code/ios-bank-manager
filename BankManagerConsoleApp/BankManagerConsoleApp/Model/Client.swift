//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 김예준 on 11/2/23.
//

import Foundation

struct Client: CustomStringConvertible {
    private let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var description: String {
        "\(self.id)번 고객"
    }
}
