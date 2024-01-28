//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


// TODO: - enum으로 만드는게 좋을지 구조체로 만드는 것이 좋을지 고민중

struct BankManager {
    enum workMessage: String {
        case start = "번 고객 업무 시작"
        case done = "번 고객 업무 완료"
    }
    
    func sendMessage(work: workMessage, count: Int) {
        print("\(count)\(work.rawValue)")
    }
}

// TODO: - enum으로 만드는게 좋을지 구조체로 만드는 것이 좋을지 고민중
/*
enum BankManager {
    case start(Int)
    case done(Int)
    
    init(work: BankManager) {
        self = work
        switch self {
        case .start(let count):
            print("\(count)번 고객 업무 시작")
        case .done(let count):
            print("\(count)번 고객 업무 완료")
        }
    }
}
*/
