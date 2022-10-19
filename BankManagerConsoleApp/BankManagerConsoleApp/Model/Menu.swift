//
//  Menu.swift
//  BankManagerConsoleApp
//
//  Created by Schro on 2022/10/19.
//

import Foundation

enum Menu {
    case bankOpen
    case bankClose
    
    var description: String {
        switch self {
        case .bankOpen:
            return "1"
        case .bankClose:
            return "2"
        }
    }
}
