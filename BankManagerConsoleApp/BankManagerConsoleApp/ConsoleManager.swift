//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by 미르, 희동 on 1/29/24.
//

import Foundation

struct ConsoleManager {
    let isBool = true
    
    func create() {
        while isBool {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 :", terminator:" ")
            guard let input = readLine() else { return }
            
            switch input {
            case "1":
                print("시작")
            case "2":
                return
            default:
                print("메뉴를 다시 선택해주세요.")
                continue
            }
        }
    }
}
