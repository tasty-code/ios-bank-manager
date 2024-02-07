//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by yujaehong on 1/31/24.
//

import Foundation

final class Node<T> {
    var value: T
    var next: Node?
    
    init(_ value: T, _ next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
