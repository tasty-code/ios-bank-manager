//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let clientDispatcher: ClientQueueManagable
    
    private let bankers: [Banker]
    
    init(
        bankers: [Banker],
        clientDispatcher: ClientQueueManagable
    ) {
        self.clientDispatcher = clientDispatcher
        self.bankers = bankers
    }
    
    func start() {
        makeList()
        let group = DispatchGroup()
        for banker in bankers {
            banker.start(group: group)
        }
        group.wait()
    }
    
    private func makeList() {
        let numberOfClient = Int.random(in: 10...30)
        for number in 1...numberOfClient {
            let client = Client(number: number)
            self.clientDispatcher.enqueueClient(client)
        }
    }
}
