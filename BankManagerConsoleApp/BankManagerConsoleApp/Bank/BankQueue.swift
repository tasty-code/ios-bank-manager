//
//  BankQueue.swift
//  BankManagerConsoleApp
//
//  Created by 신동오 on 2023/03/07.
//

import Foundation

struct BankQueue {
    private var queue: [BankingType: Queue<Client>] = [:]
    private var semaphore: [BankingType: DispatchSemaphore] = [:]
    
    init() {
        BankingType.allCases.forEach { bankingType in
            queue[bankingType] = Queue<Client>()
            semaphore[bankingType] = DispatchSemaphore(value: 1)
        }
    }
    
    func queue(type: BankingType) -> Queue<Client> {
        return queue[type] ?? Queue<Client>()
    }
    
    func semaphore(type: BankingType) -> DispatchSemaphore {
        return semaphore[type] ?? DispatchSemaphore(value: 1)
    }
}
