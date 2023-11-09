//
//  InterfaceMenu.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/09.
//

import Foundation

enum InterfaceMenu: Int {
    case run = 1
    case exit
    
    static func convertIntToInterfaceMenu(_ rawValue: Int) throws -> Self {
        switch rawValue {
        case 1: return .run
        case 2: return .exit
        default: throw InterfaceErrorMessage.wrongMenuSelected
        }
    }
}
