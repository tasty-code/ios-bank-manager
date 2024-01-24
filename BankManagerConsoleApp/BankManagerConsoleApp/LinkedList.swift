//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 1/23/24.
//

final class LinkedList<Value> {
    private(set) var head: Node<Value>?
    
    private(set) var tail: Node<Value>?

    var first: Value? {
        return head?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    init(head: Node<Value>? = nil) {
        self.head = head
        var lastNode = self.head
        while let next = lastNode?.next {
            lastNode = next
        }
        self.tail = lastNode
    }
    
    func add(value: Value) {
        let newNode = Node(value: value)
        guard let currentTail = self.tail else {
            self.head = newNode
            self.tail = self.head
            return
        }
        currentTail.next = newNode
        self.tail = newNode
    }
    
    @discardableResult
    func removeFirst() -> Value? {
        let result = head?.value
        self.head = head?.next
        return result
    }
    
    func clear() {
        self.head = nil
        self.tail = nil
    }
}
