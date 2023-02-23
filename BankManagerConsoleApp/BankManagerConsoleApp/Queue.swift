//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by J.E on 2023/02/21.
//

import Foundation

final class Queue<Element> {
    private var elements = SinglyLinkedList<Element>()
    
    func enqueue(_ node: Node<Element>) {
        elements.append(node)
    }
    
    func dequeue() -> Node<Element>? {
        return elements.removeFirstNode()
    }
    
    func clear() {
        elements.head = nil
        elements.tail = nil
    }
    
    func peekFirst() -> Node<Element>? {
        return elements.head
    }
    
    func peekLast() -> Node<Element>? {
        return elements.tail
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty()
    }
}
