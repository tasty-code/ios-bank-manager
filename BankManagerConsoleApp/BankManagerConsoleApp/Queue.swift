//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by J.E on 2023/02/21.
//

import Foundation

class Queue<Element> {
    private var elements = SinglyLinkedList<Element>()
    
    func enqueue(_ node: Node<Element>) {
        elements.append(node)
    }
    
    func dequeue() {
        elements.removeFirstNode()
    }
    
    func clear() {
        elements.head = nil
        elements.tail = nil
    }
    
    func peek() -> Node<Element>? {
        return elements.head
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty()
    }
}
