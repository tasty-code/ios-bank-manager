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
    private var head: Node<Value>?
    
    init(head: Node<Value>? = nil) {
        self.head = head
    }
    
    func getFirst() -> Value? {
        return head?.value
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
    
    mutating func add(value: Value) {
        guard let head else {
            self.head = Node(value: value)
            return
        }
        var current: Node = head
        while let next = current.next {
            current = next
        }
        current.next = Node(value: value)
    }
    
    @discardableResult
    mutating func removeFirst() -> Value? {
        guard let head else { return nil }
        let result = head.value
        self.head = head.next
        return result
    }
}

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
