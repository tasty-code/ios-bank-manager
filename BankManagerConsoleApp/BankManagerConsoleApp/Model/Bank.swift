//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김진웅 on 2023/11/02.
//

import Foundation

final class Bank {
    private var tellers: [Teller] = [
        Teller(taskType: .deposit),
        Teller(taskType: .deposit),
        Teller(taskType: .loan)
    ]
    private var visitCount: Int = 0
    private var clientQueue: Queue<Client> = Queue()
    
    func visitClient() {
        let totalClient = Int.random(in: 10...30)
        for num in 1...totalClient {
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
        print(Prompt.close(numberOfClient: visitCount, totalTaskTime: time))
    }
    
    private func assignTask(to teller: Teller) {
        guard let client = clientQueue.dequeue() else { return }
        teller.performTask(with: client)
        visitCount += 1
    }
    
    private struct Teller {
        var taskType: TaskType
        
        func performTask(with client: Client) {
            print(Prompt.taskStart(with: client))
            Thread.sleep(forTimeInterval: client.taskType.taskTime)
            print(Prompt.taskComplete(with: client))
        }
    }
}
