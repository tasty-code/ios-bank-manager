//
//  ClientManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

import Foundation

final class ClientManager {
    weak var delegate: (ClientManagerDelegate)?
    
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
        self.delegate?.handleEnqueueClient(client: client)
        self.semaphore.signal()
    }
}

extension ClientManager: ClientDequeuable {
    func dequeueClient() -> Client? {
        self.semaphore.wait()
        guard let client = self.clientQueue.dequeue() else {
            self.semaphore.signal()
            return nil
        }
        self.delegate?.handleDequeueClient(client: client)
        self.semaphore.signal()
        return client
    }
}

extension ClientManager: ClientClearable {
    func clearClients() {
        self.semaphore.wait()
        self.clientQueue.clear()
        self.semaphore.signal()
    }
}

protocol ClientManagerEnqueueClientDelegate: AnyObject {
    func handleEnqueueClient(client: Client)
}

protocol ClientManagerDequeueClientDelegate: AnyObject {
    func handleDequeueClient(client: Client)
}

protocol ClientManagerClearClientDelegate: AnyObject {
    func handleClearClient()
}

typealias ClientManagerDelegate = ClientManagerEnqueueClientDelegate & ClientManagerDequeueClientDelegate & ClientManagerClearClientDelegate
