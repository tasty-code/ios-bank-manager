//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/11.
//

import Foundation

class Node<Type> {
    var data: Type
    var next: Node?
    
    init(data: Type, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
