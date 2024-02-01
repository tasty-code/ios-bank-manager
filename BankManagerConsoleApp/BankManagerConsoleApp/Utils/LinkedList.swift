//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 2/1/24.
//

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
