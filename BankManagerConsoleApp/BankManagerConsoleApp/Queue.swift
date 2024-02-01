//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

final class Node<Value> {
    let value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

final class LinkedList<Value> {
    private(set) var head: Node<Value>?
    
    private(set) var tail: Node<Value>?

    private(set) var count: Int
    
    var first: Value? {
        return head?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    init(head: Node<Value>? = nil) {
        self.head = head
        self.count = self.head == nil ? 0 : 1
        var lastNode = self.head
        while let next = lastNode?.next {
            lastNode = next
            self.count += 1
        }
        self.tail = lastNode
    }
    
    func add(value: Value) {
        let newNode = Node(value: value)
        guard let currentTail = self.tail else {
            self.head = newNode
            self.tail = self.head
            self.count = 1
            return
        }
        currentTail.next = newNode
        self.tail = newNode
        self.count += 1
    }
    
    @discardableResult
    func removeFirst() -> Value? {
        let result = self.head?.value
        guard self.head !== self.tail else {
            self.head = nil
            self.tail = nil
            self.count = 0
            return result
        }
        self.head = self.head?.next
        self.count -= 1
        return result
    }
    
    func clear() {
        self.head = nil
        self.tail = nil
        self.count = 0
    }
}

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
