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
    
    private var isWorking: Bool = false
    
    init(
        clientManager: ClientDequeuable
    ) {
        self.clientManager = clientManager
    }
    
    func start(group: DispatchGroup) {
        guard self.isWorking == false else { return }
        DispatchQueue.global().async(group: group) {
            self.isWorking = true
            while self.isWorking, let client = self.clientManager.dequeueClient() {
                self.work(for: client)
            }
            self.isWorking = false
        }
    }
    
    func stop() {
        self.isWorking = false
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
