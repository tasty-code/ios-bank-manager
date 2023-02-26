//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/21.
//

import Foundation

final class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}
