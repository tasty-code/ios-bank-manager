//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/22/24.
//

class Node<Value> {
    let value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<Value> {
    var head: Node<Value>?
    
    func getFirst() -> Value? {
        guard let head else { return nil }
        return head.value
    }
    
    func travel() -> [Value] {
        guard let head else { return [] }
        var result: [Value] = []
        var current: Node = head
        while true {
            result.append(current.value)
            guard let next = current.next else { break }
            current = next
        }
        return result
    }
    
    var count: Int {
        var result: Int = 0
        guard let head else { return result }
        var current: Node = head
        while true {
            result += 1
            guard let next = current.next else { break }
            current = next
        }
        return result
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func add(value: Value) {
        guard let head else { return }
        var current: Node = head
        while let next = current.next {
            current = next
        }
        current.next = Node(value: value)
    }
    
    @discardableResult
    mutating func removeFirst() -> Value? {
        guard let head else { return nil }
        self.head = head.next
        return head.value
    }
}

struct Queue<Value> {
    var linkedList: LinkedList<Value>
    
    var isEmpty: Bool {
        return self.linkedList.isEmpty
    }
    
    func enqueue(_ value: Value) {
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
