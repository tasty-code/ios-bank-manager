//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by 미르, 희동 on 1/29/24.
//

import Foundation

struct ConsoleManager: CustomerNumbering {
    private let isBool: Bool = true
    var numOfPerson: Int = Int.random(in: 10...30)
    
    private enum Message {
        static let menu = """
                          1 : 은행개점
                          2 : 종료
                          입력 :
                          """
        static let reselection = "메뉴를 다시 선택해주세요."
    }
    
    func startBank() {
        while isBool {
            print(Message.menu, terminator: " ")
            guard let input = readLine() else { return }
            
            switch input {
            case "1":
                Bank(numOfPerson: numOfPerson).openBank()
            case "2":
                return
            default:
                print(Message.reselection)
                continue
            }
        }
    }
}
