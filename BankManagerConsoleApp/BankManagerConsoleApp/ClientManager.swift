//
//  ClientManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

final class ClientManager {
    private let clientQueue: Queue<Client>
    
    init() {
        self.clientQueue = Queue()
    }
}

extension ClientManager: ClientEnqueuable {
    func enqueueClient(_ client: Client) {
        self.clientQueue.enqueue(client)
    }
}

extension ClientManager: ClientDequeuable {
    func dispatchClient() -> Client? {
        return self.clientQueue.dequeue()
    }
}
