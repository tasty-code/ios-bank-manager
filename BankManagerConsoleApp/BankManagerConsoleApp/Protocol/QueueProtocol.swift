//
//  QueueProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/21.
//

import Foundation

protocol Queue {
    associatedtype T
    var head: T? { get set }
    
    mutating func enqueue(_ newNode: T)
    mutating func dequeue() -> T?
    func clear()
    func peek()
    func isEmpty() -> Bool
}
