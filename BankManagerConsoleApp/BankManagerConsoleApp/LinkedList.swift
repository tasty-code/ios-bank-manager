//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/21.
//

import Foundation

struct LinkedList<Value: Equatable> {
    private var head: Node<Value>?
    private var tail: Node<Value>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        
        return node.next!
    }
    
    mutating func pop() -> Value? {
        let excludeData = head?.value
        head = head?.next
        
        if isEmpty {
            tail = nil
        }
        
        return excludeData
    }
    
    mutating func removeLast() -> Value? {
        guard let head = head else { return nil }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return current.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
