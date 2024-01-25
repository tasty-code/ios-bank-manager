//
//  QueueProtocol.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/25/24.
//

protocol QueueProtocol {
    associatedtype Element
    var peek: Element? {get}
    var isEmpty: Bool {get}
    func enqueue(_ element: Element)
    func dequeue() -> Element?
    func clear()
}
