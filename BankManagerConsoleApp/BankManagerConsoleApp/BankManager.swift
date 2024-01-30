//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 김동준 on 1/30/24.
//

import Foundation

struct BankManager {
    var isRunning: Bool = true
    var bank = Bank()
    
    mutating func run() {
        while isRunning {
            print("1: 은행 개점")
            print("2: 종료")
            print("입력: ", terminator: "")
            guard let inputText = readLine() else { return }
            
            switch inputText {
            case "1":
                bank.open()
            case "2":
                isRunning = false
            default:
                continue
            }
        }
    }
}
