//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func assist(queue: Queue<Int>) {
        let client = getFirstClient(from: queue)
        assist(client!)
    }

    private func getFirstClient(from queue: Queue<Int>) ->  Int? {
        return queue.dequeue()
    }

    private func assist(_ client: Int){
        print("\(client)번 고객 업무 시작")
        usleep(700000)
        print("\(client)번 고객 업무 완료")
    }
}
