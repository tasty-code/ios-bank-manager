//
//  Menu.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum Menu: String {
    
    case open = "1"
    case close = "2"
    
}

extension Menu: CaseIterable, CustomStringConvertible {
    
    var description: String {
        switch self {
        case .open:
            return "은행개점"
        case .close:
            return "종료"
        }
    }
    
}
