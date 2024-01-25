//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by nayeon  on 2024/01/23.
//

import Foundation

final class LinkedList<Element> {
    private(set) var head: Node<Element>?
    private(set) var tail: Node<Element>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
    
    func append(new item: Element) {
        let newNode = Node(data: item)
        
        guard let node = tail else {
            head = newNode
            tail = newNode
            count += 1
            return
        }
        node.next = newNode
        tail = newNode
        count += 1
    }
    
    func removeFirst() -> Element? {
        let removeNodeValue = head?.data
        
        head = head?.next
        tail = isEmpty ? head : tail
        count = isEmpty ? count : count - 1
        
        return removeNodeValue
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}

