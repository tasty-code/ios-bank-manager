//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김진웅 on 2023/11/02.
//

import Foundation

final class Bank {
    private var clientQueue: Queue<Client> = Queue()
    private let tellers: [Teller] = [
        Teller(taskType: .deposit),
        Teller(taskType: .deposit),
        Teller(taskType: .loan)
    ]
    private let numberOfClient: Int = Int.random(in: 10...30)
    private let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    private let tellerGroup: DispatchGroup = DispatchGroup()
    
    
    func visitClient() {
        for num in 1...numberOfClient {
            clientQueue.enqueue(data: Client(id: num))
        }
    }
    
    func open() {
        while !clientQueue.isEmpty {
            tellers.forEach { teller in
                assignTask(to: teller)
            }
        }
    }
    
    func close(time: TimeInterval) {
        print(Prompt.close(numberOfClient: numberOfClient, totalTaskTime: time))
    }
    
    private func assignTask(to teller: Teller) {
        guard let client = clientQueue.dequeue() else { return }
        teller.performTask(with: client)
    }
    
    private struct Teller {
        let taskType: TaskType
        
        func performTask(with client: Client) {
            print(Prompt.taskStart(with: client))
            Thread.sleep(forTimeInterval: client.taskType.taskTime)
            print(Prompt.taskComplete(with: client))
        }
    }
}
