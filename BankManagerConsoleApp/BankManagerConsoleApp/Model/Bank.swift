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
        tellers.forEach { teller in
            DispatchQueue.global().async(group: tellerGroup) { [self] in
                assignTask(to: teller)
            }
        }
        tellerGroup.wait()
    }
    
    func close(time: TimeInterval) {
        print(Prompt.close(numberOfClient: numberOfClient, totalTaskTime: time))
    }
    
    private func assignTask(to teller: Teller) {
        while !clientQueue.isEmpty {
            semaphore.wait()
            
            guard let clientTask = clientQueue.peek?.taskType,
                  clientTask == teller.taskType
            else {
                semaphore.signal()
                continue
            }
            
            guard let client = clientQueue.dequeue() else {
                return
            }
            
            semaphore.signal()
            
            teller.performTask(with: client)
        }
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
