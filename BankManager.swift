//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func assist(_ client: Int){
        print("\(client)번 고객 업무 시작")
        usleep(700000)
        print("\(client)번 고객 업무 완료")
    }
}
