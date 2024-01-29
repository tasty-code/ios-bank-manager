//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 1/23/24.
//

final class Queue<Value> {
    private var linkedList: LinkedList<Value>
    
    var front: Node<Value>? {
        return self.linkedList.head
    }
    
    var rear: Node<Value>? {
        return self.linkedList.tail
    }
    
    var isEmpty: Bool {
        return self.linkedList.isEmpty
    }
    
    var count: Int {
        return self.linkedList.count
    }
    
    init(linkedList: LinkedList<Value> = LinkedList()) {
        self.linkedList = linkedList
    }
    
    func enqueue(_ value: Value) {
        self.linkedList.add(value: value)
    }
    
    @discardableResult
    func dequeue() -> Value? {
        return self.linkedList.removeFirst()
    }
    
    func clear() {
        self.linkedList.clear()
    }
    
    func peek() -> Value? {
        return self.linkedList.first
    }
}
