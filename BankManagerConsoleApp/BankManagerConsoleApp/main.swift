//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func execute() {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    let input = readLine() ?? ""

    switch input {
    case "1":
        print("은행개점")
        execute()
    case "2":
        print("종료")
    default:
        print("입력이 잘못되었습니다.")
        execute()
    }
}

execute()
