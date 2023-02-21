//
//  SinglyLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/02/21.
//

import Foundation

class SinglyLinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    var nodeCount: Int
    
    init() {
        self.nodeCount = 0
    }
    
    init(_ node: Node<Element>) {
        self.head = node
        self.tail = node
        self.nodeCount = 1
    }
    
    func isEmpty() -> Bool {
        return nodeCount == 0 ? true : false
    }
    
    func append(_ node: Node<Element>) {
        if isEmpty() {
            head = node
        } else {
            tail?.setNext(node)
        }
        tail = node
        nodeCount += 1
    }
    
    func removeFirst() {
        guard !isEmpty() else { return }
        head = head?.getNext()
        nodeCount -= 1
    }
}
