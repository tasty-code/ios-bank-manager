//
//  ClientDequeuable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

final class ClientManager: ClientDequeuable {
    private let clientQueue: Queue<Client>
    
    init() {
        self.clientQueue = Queue()
    }
    
    func dispatchClient() -> Client? {
        return self.clientQueue.dequeue()
    }
}

extension ClientManager: ClientEnqueuable {
    func enqueueClient(_ client: Client) {
        self.clientQueue.enqueue(client)
    }
}
