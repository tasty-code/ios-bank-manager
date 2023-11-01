//
//  Prompt.swift
//  BankManagerConsoleApp
//
//  Created by 김진웅 on 2023/11/01.
//

import Foundation

enum Prompt: CustomStringConvertible {
    case menu
    case taskStart(with: Client)
    case taskComplete(with: Client)
    case close(number: Int, time: Double)
    
    var description: String {
        switch self {
        case .menu:
            return  """
                    1 : 은행개점
                    2 : 종료
                    입력 : 
                    """
        case .taskStart(let client):
            return "\(client.id)번 고객 업무 시작"
        case .taskComplete(let client):
            return "\(client.id)번 고객 업무 완료"
        case .close(let number, let time):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(number)명이며, 총 업무시간은 \(time)초입니다."
        }
    }
}
