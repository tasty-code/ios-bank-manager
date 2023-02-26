//
//  NameSpace.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum Namespace {
    enum CustomerAmount: UInt {
        case min = 10
        case max = 30
    }
    
    static var numberOfCustomer: UInt {
        guard let customerSum = (CustomerAmount.min.rawValue...CustomerAmount.max.rawValue).randomElement() else { return 0 }
        return customerSum
    }
    
    static var workTime: Double = 0.7
    
    enum printText {
        static var state = "1 : 은행개점 \n2 : 종료 \n입력 : "
        static func cloase(numberOfCustomer: UInt, customerTime: Double) -> String {
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(customerTime)초 입니다.\n"
        }
        static func working(order: UInt, result: Bool) -> String {
            let resultString = (result == true) ? "시작" : "완료"
            return "\(order)번 고객 업무 \(resultString)\n"
        }
    }
    
}
