//
//  TaskManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

import Foundation

final class TaskManager {
    private let clientQueue: Queue<Client>
    
    private let bankerQueue: Queue<ClientTaskHandlable>
    
    private let semaphore: DispatchSemaphore = .init(value: 1)
    
    init(
        clientQueue: Queue<Client> = .init(),
        bankerQueue: Queue<ClientTaskHandlable> = .init()
    ) {
        self.clientQueue = clientQueue
        self.bankerQueue = bankerQueue
    }
}

extension TaskManager: TaskManagable {
    func startTaskManaging(group: DispatchGroup) {
        // 시작 전에 은행원 수 캡쳐
        let bankerCount = self.bankerQueue.count
        
        DispatchQueue.global().async(group: group) {
            while true {
                if self.clientQueue.isEmpty == false {
                    if self.bankerQueue.isEmpty == false {
                        guard let banker = self.bankerQueue.dequeue(),
                              let client = self.clientQueue.dequeue() else { continue }
                        banker.handle(client: client, group: group)
                    } else {
                        continue
                    }
                } else {
                    if self.bankerQueue.count == bankerCount {
                        break
                    } else {
                        continue
                    }
                }
            }
        }
    }
}

extension TaskManager: BankerEnqueuable {
    func enqueueBanker(_ taskHandlable: ClientTaskHandlable) {
        // race 관리 or not
        self.bankerQueue.enqueue(taskHandlable)
    }
}

extension TaskManager: ClientEnqueuable {
    func enqueueClient(_ client: Client) {
        self.clientQueue.enqueue(client)
    }
}

extension TaskManager: StatGeneratable {
    func generateStat() -> TaskStat {
        // TODO: 결과 집계 구현 (리턴..)
        return TaskStat(clientCount: 0)
    }
}
