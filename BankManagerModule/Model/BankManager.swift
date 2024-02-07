//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let bankers: [Banker]
    
    private let clientManager: [BankTask: ClientEnqueuable]
    
    init(
        bankers: [Banker],
        clientManager: [BankTask: ClientEnqueuable]
    ) {
        self.bankers = bankers
        self.clientManager = clientManager
    }
    
    func start() {
        makeClientList()
        let group = DispatchGroup()
        DispatchQueue.global().async {
            let totalWorkTime = measure {
                for banker in bankers {
                    banker.start(group: group)
                }
                group.wait()
            }
        }
    }
}

private extension BankManager {
    func makeClientList() {
        let numberOfClient = Int.random(in: 10...30)
        
        for number in 1...numberOfClient {
            guard let bankTaskType = BankTask.random else { return }
            let client = Client(number: number, task: bankTaskType)
            self.clientManager[bankTaskType]?.enqueueClient(client: client)
        }
    }
    
    func measure(_ progress: () -> Void) -> TimeInterval {
        let start = Date()
        progress()
        return Date().timeIntervalSince(start)
    }
}
