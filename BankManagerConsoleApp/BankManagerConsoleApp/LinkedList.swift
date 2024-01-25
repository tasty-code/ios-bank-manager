
import Foundation

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    var count: Int {
        if head == nil {
            return 0
        }
        
        var count = 1
        var lastNode: Node<T>? = head
        
        while let next = lastNode?.next {
            lastNode = next
            count += 1
        }
        
        return count
    }
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
}

extension LinkedList {
    subscript(index: Int) -> Node<T>? {
        if index < 0 || index > count - 1 {
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
    
    public func getNode(index: Int) -> Node<T>? {
        if index < 0 || index > count {
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
    
    public func add(_ newNode: Node<T>) {
        guard let lastNode = getLastNode() else {
            head = newNode
            return
        }
        
        lastNode.refer(to: newNode)
    }
    
    public func add(_ newNode: Node<T>, after previousNode: Node<T>) {
        if let temporaryNode = previousNode.next {
            newNode.refer(to: temporaryNode)
        }
        
        previousNode.refer(to: newNode)
    }
    
    public func remove(_ node: Node<T>) {
        let previousNode = findPreviousNode(of: node)
        
        guard let nextNode = node.next else {
            previousNode?.refer(to: nil)
            return
        }
        
        previousNode?.refer(to: nextNode)
    }
    
    public func removeAll() {
        head = nil
    }
}

extension LinkedList {
    private func findPreviousNode(of node: Node<T>) -> Node<T>? {
        if let reference = head?.next, reference == node {
            return head
        }
        
        var nextNode = head?.next
            
        while nextNode?.next != nil {
            if let reference = nextNode?.next, reference == node {
                return nextNode
            }
            nextNode = nextNode?.next
        }
        
        return nil
    }
    
    private func getLastNode() -> Node<T>? {
        if head == nil {
            return nil
        }
        
        var lastNode = head
        while lastNode?.next != nil {
            lastNode = lastNode?.next
        }
        
        return lastNode
    }
}
