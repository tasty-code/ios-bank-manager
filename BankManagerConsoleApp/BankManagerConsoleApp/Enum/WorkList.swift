//
//  WorkList.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/23.
//

import Foundation

enum WorkList: String, CustomStringConvertible {
    case openBank = "1"
    case closeBank = "2"
    
    var description: String {
        return self.rawValue
    }
}
