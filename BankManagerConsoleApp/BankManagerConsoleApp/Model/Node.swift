//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/25/24.
//

final class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
