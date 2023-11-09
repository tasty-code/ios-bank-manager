//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김진웅 on 2023/11/02.
//

import Foundation

final class Bank {
    private var clientQueue: Queue<Client> = Queue()
    private let depositSemaphore: DispatchSemaphore
    private let loanSemaphore: DispatchSemaphore
    private let tellerGroup: DispatchGroup = DispatchGroup()
    private let dispatchQueue: DispatchQueue = DispatchQueue.global()
    
    init(depositTeller: Int, loanTeller: Int) {
        depositSemaphore = DispatchSemaphore(value: depositTeller)
        loanSemaphore = DispatchSemaphore(value: loanTeller)
    }
    
    func visit(numberOfClient: Int) {
        for num in 1...numberOfClient {
            clientQueue.enqueue(data: Client(id: num))
        }
    }
    
    func open() {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.peek else {
                return
            }
            
            switch client.taskType {
            case .deposit:
                assignTask(semaphore: depositSemaphore)
            case .loan:
                assignTask(semaphore: loanSemaphore)
            }
        }
        tellerGroup.wait()
    }
    
    func close(numberOfClient: Int, at time: Double) {
        print(Prompt.close(numberOfClient: numberOfClient, totalTaskTime: time))
    }
        
    private func assignTask(semaphore: DispatchSemaphore) {
        semaphore.wait()
        guard let client = clientQueue.dequeue() else {
            semaphore.signal()
            return
        }
        
        dispatchQueue.async(group: tellerGroup) { [weak self] in
            self?.performTaskService(with: client)
            semaphore.signal()
        }
    }
    
    private func performTaskService(with client: Client) {
        print(Prompt.taskStart(with: client))
        Thread.sleep(forTimeInterval: client.taskType.taskTime)
        print(Prompt.taskComplete(with: client))
    }
}
