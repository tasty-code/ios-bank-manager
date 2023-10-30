//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 10/30/23.
//

import Foundation

struct Queue<Element> {
    private var head: Node?
    private var tail: Node?
    
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

extension Queue {
    private class Node {
        var data: Element
        var pointer: Node?
        
        init(data: Element, pointer: Node? = nil) {
            self.data = data
            self.pointer = pointer
        }
    }
}
