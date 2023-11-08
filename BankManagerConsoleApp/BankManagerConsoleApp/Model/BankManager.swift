//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager: BankManagable {
    private var clientQueue = Queue<Client>()
    private var totalWorkTime = 0.0
    private let loanSemaphore: DispatchSemaphore
    private let depositSemaphore: DispatchSemaphore
    
    init(loanClerkCount: Int, depositClerkCount: Int) {
        self.loanSemaphore = DispatchSemaphore(value: loanClerkCount)
        self.depositSemaphore = DispatchSemaphore(value: depositClerkCount)
    }
    
    func recept(for client: Client) {
        self.clientQueue.enqueue(client)
    }
    
    func startWork() {
        let group = DispatchGroup()
        
        while self.clientQueue.isEmpty == false {
            guard let client = self.clientQueue.peek else { return }
            switch client.taskType {
            case .loan:
                self.callClient(semaphore: loanSemaphore, group: group)
            case .deposit:
                self.callClient(semaphore: depositSemaphore, group: group)
            }
        }
        
        group.wait()
    }
    
    func getTotalWorkTime() -> Double {
        return self.totalWorkTime
    }
    
    private func callClient(semaphore: DispatchSemaphore, group: DispatchGroup) {
        semaphore.wait()
        guard let client = clientQueue.dequeue() else { return }
        DispatchQueue.global().async(group: group) {
            self.task(for: client)
            semaphore.signal()
        }
    }
    
    private func task(for client: Client) {
        print(WorkState.start(client: client))
        self.working(for: client.taskType.requiredTime)
        print(WorkState.end(client: client))
    }
    
    private func working(for time: Double) {
        Thread.sleep(forTimeInterval: time)
        self.totalWorkTime += time
    }
}

extension BankManager {
    private enum WorkState: CustomStringConvertible  {
        case start(client: Client)
        case end(client: Client)
        
        var description: String {
            switch self {
            case .start(let client):
                return "\(client) \(client.taskType)업무 시작"
            case .end(let client):
                return "\(client) \(client.taskType)업무 완료"
            }
        }
    }
}
