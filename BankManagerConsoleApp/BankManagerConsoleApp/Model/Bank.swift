//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김진웅 on 2023/11/02.
//

import Foundation

final class Bank {
    private var clientQueue: Queue<Client> = Queue()
    private let numberOfClient: Int = Int.random(in: 10...30)
    private let tellerSemaphore: DispatchSemaphore
    private let depositSemaphore: DispatchSemaphore
    private let loanSemaphore: DispatchSemaphore
    
    init(depositTeller: Int, loanTeller: Int) {
        tellerSemaphore = DispatchSemaphore(value: depositTeller + loanTeller)
        depositSemaphore = DispatchSemaphore(value: depositTeller)
        loanSemaphore = DispatchSemaphore(value: loanTeller)
    }
    
    func visitClient() {
        for num in 1...numberOfClient {
            clientQueue.enqueue(data: Client(id: num))
        }
    }
    
    func open() {
        let tellerGroup: DispatchGroup = DispatchGroup()
        let dispatchQueue: DispatchQueue = DispatchQueue.global()
        
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else {
                return
            }
            tellerSemaphore.wait()
            dispatchQueue.async(group: tellerGroup) { [weak self] in
                self?.assignTask(with: client)
                self?.tellerSemaphore.signal()
            }
        }
        tellerGroup.wait()
    }
    
    func close(at time: Double) {
        print(Prompt.close(numberOfClient: numberOfClient, totalTaskTime: time))
    }
    
    private func taskService(with client: Client) {
        print(Prompt.taskStart(with: client))
        Thread.sleep(forTimeInterval: client.taskType.taskTime)
        print(Prompt.taskComplete(with: client))
    }
    
    private func assignTask(with client: Client) {
        switch client.taskType {
        case .loan:
            loanSemaphore.wait()
            taskService(with: client)
            loanSemaphore.signal()
        case .deposit:
            depositSemaphore.wait()
            taskService(with: client)
            depositSemaphore.signal()
        }
    }
}
