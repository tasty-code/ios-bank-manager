//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

import Foundation

final class Banker {
    private let clientManager: any ClientDequeuable
    
    init(
        clientManager: any ClientDequeuable
    ) {
        self.clientManager = clientManager
    }
    
    func start(group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            while let client = self.clientManager.dequeueClient() {
                self.work(for: client)
            }
        }
    }
}

private extension Banker {
    func work(for client: Client) {
        self.startTask(for: client)
        Thread.sleep(forTimeInterval: client.task.duration)
        self.endTask(for: client)
    }
    
    func startTask(for client: Client) {
    }
    
    func endTask(for client: Client) {

    }
}
