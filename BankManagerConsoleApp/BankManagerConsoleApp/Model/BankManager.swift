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
            self.loanSemaphore.wait()
            guard let client = self.clientQueue.dequeue() else { return }
            DispatchQueue.global().async(group: group) {
                self.task(for: client)
                self.loanSemaphore.signal()
            }
        }
        
        group.wait()
    }
    
    func getTotalWorkTime() -> Double {
        return self.totalWorkTime
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
