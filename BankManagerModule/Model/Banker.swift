//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

import Foundation

final class Banker {
    private let clientManager: ClientDequeuable
    
    weak var delegate: BankerDelegate?
    
    init(
        clientManager: ClientDequeuable
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
        self.delegate?.handleStartTask(client: client)
    }
    
    func endTask(for client: Client) {
        self.delegate?.handleEndTask(client: client)
    }
}

protocol BankerStartTaskDelegate: AnyObject {
    func handleStartTask(client: Client)
}

protocol BankerEndTaskDelegate: AnyObject {
    func handleEndTask(client: Client)
}

typealias BankerDelegate = BankerStartTaskDelegate & BankerEndTaskDelegate
