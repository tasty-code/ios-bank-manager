//
//  QueueProtocol.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/25/24.
//

protocol QueueProtocol {
    associatedtype Element
    func enqueue(_ element: Element)
    func dequeue() -> Element?
    func clear()
    func peek() -> Element?
    func isEmpty() -> Bool
}
