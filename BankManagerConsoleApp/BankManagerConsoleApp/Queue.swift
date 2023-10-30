//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 10/30/23.
//

import Foundation

class Node<Element> {
    var data: Element
    var pointer: Node<Element>?
    
    init(data: Element, pointer: Node<Element>? = nil) {
        self.data = data
        self.pointer = pointer
    }
}

struct Queue<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var count = 0
    var peek: Element? { head?.data }
    var isEmpty: Bool { head == nil && tail == nil }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    mutating func enqueue(_ newElement: Element) {
        let node = Node(data: newElement)
        
        if isEmpty {
            head = node
        }
        
        tail?.pointer = node
        tail = node
    }
    
    mutating func dequeue() -> Element? {
        let element = head?.data
        head = head?.pointer
        
        if head == nil {
            tail = nil
        }
        
        return element
    }
}
