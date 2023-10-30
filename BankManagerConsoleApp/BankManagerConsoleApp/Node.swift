//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 김수경 on 2023/10/30.
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


