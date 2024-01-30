//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    var isOpen: Bool = true
    
    func printMenuOfBank() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    mutating func operateBank() {
        while isOpen {
            printMenuOfBank()
            guard let input = selectBankingOperation() else { return }
            executeBankingOperation(of: input)
        }
    }
    
    mutating func executeBankingOperation(of input: String) {
        switch input {
        case "1": 
            print("은행개점")
        case "2":
            print("은행종료")
            isOpen = false
        default:
            break
        }
    }
    
    func selectBankingOperation() -> String? {
        guard let input = readLine() else { return nil }
        return input
    }
}
