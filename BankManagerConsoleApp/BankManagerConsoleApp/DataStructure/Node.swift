//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by ㅣ on 1/24/24.
//

import Foundation

final class Node<T> {
    var data: T
    var next: Node?
    
    init(_ data: T, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
