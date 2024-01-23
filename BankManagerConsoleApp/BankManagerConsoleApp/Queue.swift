//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 1/23/24.
//

struct Queue<Value> {
    private var linkedList: LinkedList<Value>
    
    var isEmpty: Bool {
        return self.linkedList.isEmpty
    }
    
    init(linkedList: LinkedList<Value> = LinkedList()) {
        self.linkedList = linkedList
    }
    
    mutating func enqueue(_ value: Value) {
        self.linkedList.add(value: value)
    }
    
    @discardableResult
    mutating func dequeue() -> Value? {
        return self.linkedList.removeFirst()
    }
    
    mutating func clear() {
        while self.isEmpty == false {
            self.dequeue()
        }
    }
    
    mutating func peek() -> Value? {
        return self.linkedList.getFirst()
    }
}
