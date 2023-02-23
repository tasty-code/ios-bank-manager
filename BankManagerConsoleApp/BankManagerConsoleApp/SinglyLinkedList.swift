//
//  SinglyLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/02/21.
//

import Foundation

final class SinglyLinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    private var nodeCount: Int {
        var count: Int = head == nil ? 0 : 1
        var nodeForCount = head
        while nodeForCount?.nextNode != nil {
            count += 1
            nodeForCount = nodeForCount?.nextNode
        }
        return count
    }
    
    init(_ node: Node<Element>? = nil) {
        self.head = node
        self.tail = node
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
    }
    
    func removeFirstNode() -> Node<Element>? {
        guard !isEmpty() else { return nil }
        let firstNode = head
        head = head?.nextNode
        return firstNode
    }
}
