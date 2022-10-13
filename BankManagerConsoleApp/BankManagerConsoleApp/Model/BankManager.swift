//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Menu {
    static let start: String = "1"
    static let exit: String = "2"
}

struct BankManager {
    mutating func startWork(for clientNumber: Int) {
        print("\(clientNumber)번 고객 업무 시작")
        print("\(clientNumber)번 고객 업무 종료")
    }
}
