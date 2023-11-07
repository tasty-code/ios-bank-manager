//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager: BankManagable {
    private var clientQueue = Queue<Client>()
    private var totalWorkTime = 0.0
    private let semaphore: DispatchSemaphore
    
    init(_ clerkCount: Int) {
        self.semaphore = DispatchSemaphore(value: clerkCount)
    }
    
    func recept(for client: Client) {
        self.clientQueue.enqueue(client)
    }
    
    func startWork() {
        let group = DispatchGroup()
        
        while self.clientQueue.isEmpty == false {
            self.semaphore.wait()
            guard let client = self.clientQueue.dequeue() else { return }
            DispatchQueue.global().async(group: group) {
                self.task(for: client)
                self.semaphore.signal()
            }
        }
        
        group.wait()
    }
    
    private func task(for client: Client) {
        print(WorkState.start(client: client))
        self.totalWorkTime += client.task()
        print(WorkState.end(client: client))
    }
    
    func getTotalWorkTime() -> Double {
        return self.totalWorkTime
    }
}

extension BankManager {
    private enum WorkState: CustomStringConvertible  {
        case start(client: Client)
        case end(client: Client)
        
        var description: String {
            switch self {
            case .start(let client):
                return "\(client) 업무 시작"
            case .end(let client):
                return "\(client) 업무 완료"
            }
        }
    }
}
