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
    func startTaskManaging() {
        // while 조건 어쩌구
    }
}

extension TaskManager: BankerEnqueuable {
    func enqueueBanker(_ taskHandlable: ClientTaskHandlable) {
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
