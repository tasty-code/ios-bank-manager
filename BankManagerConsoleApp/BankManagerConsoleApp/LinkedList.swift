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
    
    mutating func append(data :T) {
        let newNode = Node(value: data)
        
        if isEmpty() {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func first() -> T? {
        if isEmpty() { return nil }
        return head?.value
    }
    
    mutating func last() -> Node<T>? {
        if isEmpty() { return nil }
        return tail
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
}
