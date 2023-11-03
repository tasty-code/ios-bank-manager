//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


final class BankManager {
    private var clientQueue = Queue<Client>()
    private var totalWorkTime = 0.0
    private let semaphore: DispatchSemaphore
    
    init(_ clerkCount: Int) {
        self.semaphore = DispatchSemaphore(value: clerkCount)
    }
    
    func recept(client: Client) {
        self.clientQueue.enqueue(client)
    }
    
    func startWork() {
        while self.clientQueue.isEmpty == false {
            self.semaphore.wait()
            guard let client = self.clientQueue.dequeue() else { return }
            DispatchQueue.global().async() {
                self.task(for: client)
                self.semaphore.signal()
            }
        }
    }
    
    private func task(for client: Client) {
        print(Script.WorkState.start(client: client))
        self.totalWorkTime += client.task()
        print(Script.WorkState.end(client: client))
    }
}
