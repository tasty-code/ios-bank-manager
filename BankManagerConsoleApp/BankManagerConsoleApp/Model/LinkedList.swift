//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 루피, 진 on 1/24/24.
//

struct LinkedList<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    mutating func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func isNotEmpty() -> Bool {
        return head != nil
    }
    
    mutating func count() -> UInt {
        var count: UInt = 1
        var node = head
        
        while node?.next != nil {
            node = node?.next
            count += 1
        }
        
        return count
    }
    
    mutating func append(value :T) {
        let newNode = Node(value: value)
        
        if isEmpty() {
            head = newNode
            tail = newNode
            return 
        }
        
        if isNotEmpty() {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func first() -> Node<T>? {
        guard isNotEmpty() else { return nil }
        return head
    }
    
    mutating func last() -> Node<T>? {
        guard isNotEmpty() else { return nil }
        return tail
    }
    
    mutating func insert(value: T, at index: UInt) {
        let newNode = Node(value: value)
        
        if isEmpty() {
            head = newNode
            tail = newNode
            return
        }
        
        guard let head = head else { return }
        var node = head
        
        if index == 0 {
            self.head = newNode
            self.head?.next = node
            return
        }
        
        for _ in 0..<index - Constants.nodeInterpolation {
            if let nextNode = node.next {
                node = nextNode
            }
            tail = newNode
        }
        
        let nextNode = node.next
        node.next = newNode
        node.next?.next = nextNode
    }
    
    mutating func remove(at index: UInt) -> Node<T>? {
        guard isNotEmpty() else { return nil }
        
        var node = head
        if index == 0 {
            head = node?.next
            head?.next = node?.next?.next
            return node
        }
        
        for _ in 0..<index - Constants.nodeInterpolation {
            if node?.next?.next == nil {
                tail = node?.next
                break
            }
            node = node?.next
        }
        let removedNode = node?.next
        node?.next = node?.next?.next
        return removedNode
    }
    
    mutating func removeLast() -> Node<T>? {
        guard isNotEmpty() else { return nil }
        
        var node = head
        
        while node?.next?.next != nil {
            node = node?.next
        }
        let removedNode = node?.next
        node?.next = node?.next?.next
        tail = node
        return removedNode
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    mutating func search(value: T?) -> [(Node<T>?, Int)]? {
        guard isNotEmpty() else { return nil }
        
        var result: [(Node<T>?, Int)] = []
        var node = head
        var count = 0
        while node != nil {
            count += 1
            if node?.value == value {
                result.append((node, count))
            }
            node = node?.next
        }

        return result
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var result = ""
        var node = head
        while node != nil {
            guard let unNode = node else {
                break
            }
            result += String(describing: unNode.value) + (unNode.next == nil ? "" : " -> ")
            node = unNode.next
        }
        
        return result
    }
}
