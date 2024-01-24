//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Matthew on 1/23/24.
//

import Foundation

class Node<T> {
    
    private var prev: Node<T>?
    private var value: T
    private var next: Node<T>?
    
    init(prev: Node<T>? = nil, value: T, next: Node<T>? = nil) {
        self.prev = prev
        self.value = value
        self.next = next
    }
    
    func fetchPrev() -> Node<T>? {
        return prev
    }
    
    func formPrev(_ data: Node<T>?) {
        self.prev = data
    }
    
    func fetchValue() -> T {
        return value
    }
    
    func formValue(_ data: T) {
        self.value = data
    }
    
    func fetchNext() -> Node<T>? {
        return next
    }

    func formNext(_ data: Node<T>?) {
        self.next = data
    }
}
