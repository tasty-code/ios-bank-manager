//
//  Prompt.swift
//  BankManagerConsoleApp
//
//  Created by Janine on 11/6/23.
//

import Foundation

enum Prompt: CustomStringConvertible {
    case run
    case end(totalCustomer: Int, totalTime: Double)
    case start(customer: Int, service: String)
    case finish(customer: Int, service: String)
    
    var description: String {
        switch self {
        case .run:
            return "1: 실행, 2: 종료"
        case .end(let totalCustomer, let totalTime):
            return "업무가 마감되었습니다. 오늘 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTime.toString(toDecimalPlace: 2))초 입니다"
        case .start(let customer, let service):
            return "\(customer)번 \(service)업무 시작"
        case .finish(let customer, let service):
            return "\(customer)번 \(service)업무 종료"
        }
    }
}

