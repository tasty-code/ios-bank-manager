//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func operateBank() {
    let bank = Bank()

    while true {
        print("1 : 은행 개점")
        print("2 : 종료")

        if let choice = readLine(), let menu = Int(choice) {
            switch menu {
            case 1:
                bank.open()
            case 2:
                print("프로그램을 종료합니다.")
                return
            default:
                print("올바른 메뉴를 선택해주세요.")
            }
        } else {
            print("숫자를 입력해주세요.")
        }
    }
}


operateBank()
