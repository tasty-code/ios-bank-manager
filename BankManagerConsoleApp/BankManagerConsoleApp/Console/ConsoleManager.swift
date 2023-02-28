//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct ConsoleManager {
    enum Menu: String {
        case open = "1"
        case close = "2"
        case ask = "입력: "
        
        var description: String {
            switch self {
            case .open: return self.rawValue + ": 은행개점"
            case .close: return self.rawValue + ": 종료"
            case .ask: return self.rawValue
            }
        }
    }
        
    static func askMenu() {
        print("\(Menu.open.description)")
        print("\(Menu.close.description)")
        print("\(Menu.ask.description)", terminator: "")
    }
}
