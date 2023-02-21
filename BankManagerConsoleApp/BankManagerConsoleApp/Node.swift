//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/02/21.
//

import Foundation

class Node<Element> {
    var data: Element
    var next: Node?
    
    init(_ data: Element) {
        self.data = data
    }
    
    func nextNode() -> Node<Element>? {
        return next
    }
    
    func setNextNode(_ node: Node<Element>?) {
        self.next = node
    }
}
