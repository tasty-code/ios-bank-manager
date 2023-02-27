//
//  Menu.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum Menu: String, CaseIterable {
    case open = "1"
    case close = "2"
}

extension Menu {
    var decription: String {
        switch self {
        case .open:
            return "은행개점"
        case .close:
            return "종료"
        }
    }
    
    static var consoleMenu: String {
        let menus = Menu.allCases.map{"\($0.rawValue) : \($0.decription)\n"}.joined()
        return menus + "입력 : "
    }
    
}
