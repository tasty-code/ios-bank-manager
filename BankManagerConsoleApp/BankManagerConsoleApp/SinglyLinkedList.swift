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
    private var nodeCount: Int
    
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
            tail?.nextNode = node
        }
        tail = node
        nodeCount += 1
    }
    
    func removeFirstNode() {
        guard !isEmpty() else { return }
        head = head?.nextNode
        nodeCount -= 1
    }
}
