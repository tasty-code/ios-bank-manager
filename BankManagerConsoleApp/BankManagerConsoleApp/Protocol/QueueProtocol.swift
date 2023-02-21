//
//  QueueProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/21.
//

import Foundation

protocol Queue {
    associatedtype T
    
    func enqueue(_ newData: T)
    func dequeue() -> T?
    func clear()
    func peek() -> T?
    func isEmpty() -> Bool
}
