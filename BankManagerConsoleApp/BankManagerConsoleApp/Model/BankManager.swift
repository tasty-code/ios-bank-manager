//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let clientManager: ClientQueueManagable
    
    private let bankers: [Banker]
    
    init(
        bankers: [Banker],
        clientManager: ClientQueueManagable
    ) {
        self.clientManager = clientManager
        self.bankers = bankers
    }
    
    func start() {
        makeClientList()
        let group = DispatchGroup()
        for banker in bankers {
            banker.start(group: group)
        }
        group.wait()
    }
    
    private func makeClientList() {
        let numberOfClient = Int.random(in: 10...30)
        for number in 1...numberOfClient {
            let client = Client(number: number)
            self.clientManager.enqueueClient(client)
        }
    }
}
