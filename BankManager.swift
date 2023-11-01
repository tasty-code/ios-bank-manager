//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var userChoice: Int = 0
    var isStart: Bool {
        get {
            if userChoice == 1 {
                return true
            } else {
                return false
            }
        }
    }
    
    mutating func run() {
        print("1 : 은행 개점\n2 : 종료")
        print("입력 :", terminator: " ")
        guard let input = readLine(), let number = Int(input) else {
            return
        }
        
        userChoice = number
        
        if isStart {
            
        } else {
            
        }
    }
}
