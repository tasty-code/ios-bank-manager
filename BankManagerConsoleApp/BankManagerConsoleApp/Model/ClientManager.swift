//
//  ClientManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

import Foundation

final class ClientManager<TaskType: Task> {
    private let clientQueue: Queue<Client<TaskType>>
    
    private let semaphore: DispatchSemaphore = .init(value: 1)
    
    init() {
        self.clientQueue = Queue()
    }
}

extension ClientManager: ClientEnqueuable {
    func enqueueClient(_ client: Client<TaskType>) {
        self.clientQueue.enqueue(client)
    }
}

extension ClientManager: ClientDequeuable {
    func dequeueClient() -> Client<TaskType>? {
        self.semaphore.wait()
        let result = self.clientQueue.dequeue()
        self.semaphore.signal()
        return result
    }
}
