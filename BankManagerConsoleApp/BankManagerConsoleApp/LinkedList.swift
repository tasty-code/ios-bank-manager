//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 1/23/24.
//

struct LinkedList<Value> {
    private(set) var head: Node<Value>?
    
    init(head: Node<Value>? = nil) {
        self.head = head
    }
    
    func getFirst() -> Value? {
        return head?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func add(value: Value) {
        guard let head else {
            self.head = Node(value: value)
            return
        }
        var current: Node = head
        while let next = current.next {
            current = next
        }
        current.next = Node(value: value)
    }
    
    @discardableResult
    mutating func removeFirst() -> Value? {
        let result = head?.value
        self.head = head?.next
        return result
    }
}
