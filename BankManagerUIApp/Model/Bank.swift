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
    
    func visit(client: Client) {
        clientQueue.enqueue(data: client)
    }
    
    func open() {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else {
                return
            }
            
            switch client.taskType {
            case .deposit:
                depositService(with: client)
            case .loan:
                loanService(with: client)
            }
        }
        tellerGroup.wait()
    }
    
    func clear() {
        clientQueue.clear()
    }
    
    func close(numberOfClient: Int, at time: Double) {
        print(Prompt.close(numberOfClient: numberOfClient, totalTaskTime: time))
    }
    
    private func depositService(with client: Client) {
        dispatchQueue.async(group: tellerGroup) { [weak self] in
            self?.depositSemaphore.wait()
            self?.taskService(with: client)
            self?.depositSemaphore.signal()
        }
    }
    
    private func loanService(with client: Client) {
        dispatchQueue.async(group: tellerGroup) { [weak self] in
            self?.loanSemaphore.wait()
            self?.taskService(with: client)
            self?.loanSemaphore.signal()
        }
    }
    
    private func taskService(with client: Client) {
        print(Prompt.taskStart(with: client))
        Thread.sleep(forTimeInterval: client.taskType.taskTime)
        print(Prompt.taskComplete(with: client))
    }
}
