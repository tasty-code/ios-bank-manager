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
    
    enum ExpectedNumberOfCustomers: Int {
        case maximum = 30
        case minimum = 10
        
        static var random: Int {
            return Int.random(in: Self.minimum.rawValue...Self.maximum.rawValue)
        }
    }
    
    static func askMenu() {
        print("\(Menu.open.description)")
        print("\(Menu.close.description)")
        print("\(Menu.ask.description)", terminator: "")
    }
    
    static func printingClosingMessage(about totalNumberOfCustomers: Int, with totalConsumedTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumberOfCustomers)명이며, 총 업무시간은 \(totalConsumedTime)초입니다.")
    }
}
