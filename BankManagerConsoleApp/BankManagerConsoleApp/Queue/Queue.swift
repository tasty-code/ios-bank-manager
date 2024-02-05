//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by yujaehong on 1/31/24.
//



final class Queue<T> {
    private var linkedList: LinkedList<T>
    
    init(linkedList: LinkedList<T> = LinkedList()) {
        self.linkedList = linkedList
    }
}

extension Queue {
    func enqueue(_ value: T) {
        linkedList.append(value)
    }
    
    @discardableResult
    func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> T? {
        return linkedList.first
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty
    }
}
