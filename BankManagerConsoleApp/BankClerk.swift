//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Rarla on 2023/11/01.
//

import Foundation

struct BankClerk {
    let bankClerk: Int
    let semaphore: DispatchSemaphore
    
    init(bankClerk: Int) {
        self.bankClerk = bankClerk
        self.semaphore = DispatchSemaphore(value: bankClerk)
    }
    
    func makeTask(queue: Queue<Int>, customer: Int) {
        for _ in 1...bankClerk {
            DispatchQueue.global().sync {
                for _ in 1...customer {
                    semaphore.wait()
                    guard let data = queue.peek() else { return }
                    print("\(data)번 고객 업무 시작")
                    let _ = queue.dequeue()
                    print("\(data)번 고객 업무 종료")
                    semaphore.signal()
                }
            }
        }
    }
    
}
