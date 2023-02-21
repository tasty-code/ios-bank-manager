//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/02/21.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    func append(_ value: T) {
        guard head != nil else {
            head = Node(value: value)
            tail = head
            return
        }
        let newNode = Node(value: value)
        tail?.next = newNode
        tail = newNode
    }
    
    func removeFirst() -> T? {
        guard let node = head else {
            return nil
        }
        head = node.next
        if head == nil {
            tail = nil
        }
        return node.value
    }

}

class Node<T> {
    var value: T
    var next: Node<T>?

    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}
