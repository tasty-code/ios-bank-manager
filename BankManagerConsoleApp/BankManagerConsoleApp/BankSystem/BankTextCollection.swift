//
//  BankTextCollection.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum BankTextCollection {
    
    static var consoleMenu: String {
        let menus = Menu.allCases.map{"\($0.rawValue) : \($0)\n"}.joined()
        return menus + "입력 : "
    }
    
    static func close(numberOfCustomer: UInt, customerTime: Double) -> String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(customerTime)초 입니다.\n"
    }
    
    static func working(order: UInt, inProgress: Bool) -> String {
        let resultString = (inProgress == true) ? "시작" : "완료"
        return "\(order)번 고객 업무 \(resultString)\n"
    }
    
}
