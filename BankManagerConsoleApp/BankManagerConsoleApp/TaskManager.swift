//
//  TaskManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

import Foundation

final class TaskManager<Task: Taskable> {
    private let clientQueue: Queue<Client>
    
    private let bankerQueue: Queue<ClientTaskHandlable>
    
    private let semaphore: DispatchSemaphore = .init(value: 1)
    
    init(
        clientQueue: Queue<Client>,
        bankerQueue: Queue<ClientTaskHandlable>
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

extension TaskManager: StatGeneratable {
    func generateStat() -> TaskStat {
        return TaskStat(clientCount: 0)
    }
}
