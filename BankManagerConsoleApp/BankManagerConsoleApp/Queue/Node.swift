//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/11.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
