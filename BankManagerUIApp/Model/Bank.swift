//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김진웅 on 2023/11/02.
//

import Foundation

final class Bank {

    private let depositSemaphore: DispatchSemaphore
    private let loanSemaphore: DispatchSemaphore
    private let dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .utility)

    private var clientQueue: Queue<Client> = Queue()
    private var isCancelled: Bool = false
    weak var delegate: ManagingForClientLabel?
    
    init(depositTeller: Int, loanTeller: Int) {
        depositSemaphore = DispatchSemaphore(value: depositTeller)
        loanSemaphore = DispatchSemaphore(value: loanTeller)
    }
    
    func visit(client: Client) {
        clientQueue.enqueue(data: client)
    }
    
    func open(with dispatchGroup: DispatchGroup) {
        isCancelled = false
        
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }

            switch client.taskType {
            case .deposit:
                depositService(with: client, dispatchGroup: dispatchGroup)
            case .loan:
                loanService(with: client, dispatchGroup: dispatchGroup)
            }
        }
    }
    
    func stop() {
        clientQueue.clear()
        isCancelled = true
    }
    
    func close(numberOfClient: Int, at time: Double) {
        print(Prompt.close(numberOfClient: numberOfClient, totalTaskTime: time))
    }
    
    private func depositService(with client: Client, dispatchGroup: DispatchGroup) {
        dispatchQueue.async(group: dispatchGroup) { [weak self] in
            self?.depositSemaphore.wait()
            self?.taskService(with: client)
            self?.depositSemaphore.signal()
        }
    }
    
    private func loanService(with client: Client, dispatchGroup: DispatchGroup) {
        dispatchQueue.async(group: dispatchGroup) { [weak self] in
            self?.loanSemaphore.wait()
            self?.taskService(with: client)
            self?.loanSemaphore.signal()
        }
    }
    
    private func taskService(with client: Client) {
        guard isCancelled == false else { return }
        
//        print(Prompt.taskStart(with: client))
        delegate?.move(who: client)
        Thread.sleep(forTimeInterval: client.taskType.taskTime)
//        print(Prompt.taskComplete(with: client))
        delegate?.remove(who: client)
    }
}
