//
//  CustomStringPrintMenu.swift
//  BankManagerConsoleApp
//
//  Created by MAC2020 on 2/2/24.
//

import Foundation

enum CustomStringPrintMenu: CustomStringConvertible {

    
    case format
    case printMenuText
    case isEmptyText
    case startCustomerBusiness(Int, Task)
    case endCustomerBusiness(Int, Task)
    case resultBusiness(Int, Double)
    
    var description: String {
        switch self {
            
        case .format:
            return "%.2f"
        case .printMenuText:
            return """
            1 : 은행 개점
            2 : 종료
            입력 :
            """
        case .isEmptyText:
            return ""
        case .startCustomerBusiness(let number, let task):
            return "\(number)번 고객 \(task) 업무 시작"
        case .endCustomerBusiness(let number, let task):
            return "\(number)번 고객 \(task) 업무 종료"
        case .resultBusiness(let customerCount, let time):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총  \(customerCount)명이며, 총 업무시간은 \(time)초입니다."
        }
    }
}
