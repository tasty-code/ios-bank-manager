
import Foundation

class Node<T: Equatable> {
    private let _value: T
    var value: T {
        return _value
    }
    
    private var _next: Node?
    var next: Node? {
        get {
            return _next
        }
        set(node) {
           _next = node
        }
    }
    
    init(value: T, next: Node? = nil) {
        self._value = value
        self._next = next
    }
}

extension Node {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    private var _count: Int
    var count: Int {
        return _count
    }
    
    init(head: Node<T>? = nil) {
        self.head = head
        self._count = head == nil ? 0 : 1
    }
}

extension LinkedList {
    public func getNode(index: Int) -> Node<T>? {
        if index < 0 || index > _count {
            fatalError("Index out of range")
        }
        
        if index == 0 {
            return head
        }
        
        var nextNode: Node<T>? = head

        for _ in 1...index {
            guard let next = nextNode?.next else {
                return nil
            }
            nextNode = next
        }
        return nextNode
    }
    
    public func getReferenceNode(_ node: Node<T>) -> Node<T>? {
        if let reference = head?.next, reference == node {
            return head
        }
        
        var nextNode = head?.next
            
        for _ in 1..._count {
            if let reference = nextNode?.next, reference == node {
                return nextNode
            }
            nextNode = nextNode?.next
        }
        
        return nil
    }
    
    public func addNode(_ node: Node<T>) {
        let lastNode = getNode(index: _count - 1)
        lastNode?.next = node
        _count += 1
    }
    
    public func addNode(_ node: Node<T>, after: Node<T>) {
        if let temporaryNode = after.next {
            node.next = temporaryNode
        }
        
        after.next = node
        _count += 1
    }
    
    public func removeNode(_ node: Node<T>) {
        let previousNode = getReferenceNode(node)
        
        if let nextNode = node.next {
            previousNode?.next = nextNode
        } else {
            previousNode?.next = nil
        }
      
        _count -= 1
    }
}
