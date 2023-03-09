//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/02/21.
//

import Foundation

class Node<Element> {
    private(set) var data: Element
    private var next: Node?
    var nextNode: Node? {
        get {
            return next
        }
        set(newNode) {
            next = newNode
        }
    }
    
    init(_ data: Element) {
        self.data = data
    }
}
