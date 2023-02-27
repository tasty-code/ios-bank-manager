//
//  LinkedQueue.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/21.
//

import Foundation

final class LinkedQueue<Value>: LinkedList<Value> {

    func enqueue(value: Value) { append(value) }

    func dequeue() -> Value? { removeFirst() }

    func clear() {
        guard head != nil else { return }

        head = nil
        tail = nil
    }

    func isEmpty() -> Bool { head == nil ? true : false }
}
