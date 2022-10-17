//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이은호 on 2022/10/17.
//

import Foundation

class Bank {
    func choiceMenu() {
        print("1 : 은행 개점" )
        print("2 : 종료")
        print("입력 : ", terminator: "")
        
        guard let inputMenu = Int(readLine()!) else {
            return
        }
    }
}
