//
//  SystemMenu.swift
//  BankManagerConsoleApp
//
//  Created by 이상윤 on 2023/02/23.
//

import Foundation

enum SystemMenu: Int, CustomStringConvertible {

    case open = 1
    case close = 2

    var description: String {
        switch self {
        case .open:
            return "은행개점"
        case .close:
            return "종료"
        }
    }

    static func show() {
        let open = SystemMenu.open
        let close = SystemMenu.close

        print("\(open.rawValue) : \(open)\n\(close.rawValue) : \(close)")
        print("입력 : ", terminator: "")
    }
}
