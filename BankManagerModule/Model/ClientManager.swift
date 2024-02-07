//
//  ClientManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

import Foundation

final class ClientManager {
    private let clientQueue: Queue<Client>
    
    private let semaphore: DispatchSemaphore = .init(value: 1)
    
    init() {
        self.clientQueue = Queue()
    }
}

extension ClientManager: ClientEnqueuable {
    func enqueueClient(client: Client) {
        self.semaphore.wait()
        self.clientQueue.enqueue(client)
        self.semaphore.signal()
    }
}

extension ClientManager: ClientDequeuable {
    func dequeueClient() -> Client? {
        self.semaphore.wait()
        let result = self.clientQueue.dequeue()
        self.semaphore.signal()
        return result
    }
}
