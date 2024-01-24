//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 루피, 진 on 1/24/24.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    mutating func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func append(value :T) {
        let newNode = Node(value: value)
        
        if isEmpty() {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func first() -> Node<T>? {
        if isEmpty() { return nil }
        return head
    }
    
    mutating func last() -> Node<T>? {
        if isEmpty() { return nil }
        return tail
    }
    
    mutating func insert(value: T, at: Int) {
        let newNode = Node(value: value)
        
        if isEmpty() {
            head = newNode
            tail = newNode
        } 
        
        if !isEmpty() {
            var node = head
            for _ in 1...at {
                if node?.next == nil {
                    tail = node?.next
                    break
                }
                node = node?.next
            }
            let nextNode = node?.next
            node?.next = newNode
            node?.next?.next = nextNode
        }
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
}
