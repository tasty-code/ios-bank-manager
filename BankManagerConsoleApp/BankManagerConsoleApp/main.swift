//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


while true {
    bankOpener()
    if readLine() == "2" {
        break
    }
}

func bankOpener() {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
}
