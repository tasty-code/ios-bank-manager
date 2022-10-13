//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 세윤 on 2022/10/12.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
