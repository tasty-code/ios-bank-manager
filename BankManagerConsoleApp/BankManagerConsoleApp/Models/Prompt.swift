//
//  Prompt.swift
//  BankManagerConsoleApp
//
//  Created by Janine on 11/6/23.
//

import Foundation

enum Prompt: CustomStringConvertible {
    case appLaunch
    case appFinish(totalCustomer: Int, totalWorkTime: Double)
    case serviceStart(customer: Int, service: String)
    case serviceDone(customer: Int, service: String)
    
    var description: String {
        switch self {
        case .appLaunch:
            return "1: 실행\n2: 종료\n입력:"
        case .appFinish(let totalCustomer, let totalTime):
            return "업무가 마감되었습니다. 오늘 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTime.toString(toDecimalPlace: 2))초 입니다"
        case .serviceStart(let customer, let service):
            return "\(customer)번 \(service)업무 시작"
        case .serviceDone(let customer, let service):
            return "\(customer)번 \(service)업무 종료"
        }
    }
}

