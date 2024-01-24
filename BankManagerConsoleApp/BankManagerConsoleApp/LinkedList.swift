
import Foundation

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    var count: Int {
        if head == nil {
            return 0
        }
        
        var count = 1
        var lastNode: Node<T>? = head
        
        while lastNode?.reference() != nil {
            lastNode = lastNode?.reference()
            count += 1
        }
        
        return count
    }
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
}

extension LinkedList {
    public func getNode(index: Int) -> Node<T>? {
        if index < 0 || index > count {
            fatalError("Index out of range")
        }
        
        if index == 0 {
            return head
        }
        
        var nextNode: Node<T>? = head?.reference()

        for _ in 1...index {
            guard let next = nextNode?.reference() else {
                return nil
            }
            nextNode = next
        }
        return nextNode
    }
    
    public func add(_ newNode: Node<T>) {
        if head == nil {
            head = newNode
            return
        }
        
        let lastNode = getLastNode()
        lastNode?.refer(to: newNode)
    }
    
    public func add(_ newNode: Node<T>, after previousNode: Node<T>) {
        if let temporaryNode = previousNode.reference() {
            newNode.refer(to: temporaryNode)
        }
        
        previousNode.refer(to: newNode)
    }
    
    public func remove(_ node: Node<T>) {
        let previousNode = findPreviousNode(of: node)
        
        if let nextNode = node.reference() {
            previousNode?.refer(to: nextNode)
        } else {
            previousNode?.refer(to: nil)
        }
    }
    
    public func removeAll() {
        head = nil
    }
}

extension LinkedList {
    private func findPreviousNode(of node: Node<T>) -> Node<T>? {
        if let reference = head?.reference(), reference == node {
            return head
        }
        
        var nextNode = head?.reference()
            
        while nextNode?.reference() != nil {
            if let reference = nextNode?.reference(), reference == node {
                return nextNode
            }
            nextNode = nextNode?.reference()
        }
        
        return nil
    }
    
    private func getLastNode() -> Node<T>? {
        if head == nil {
            return nil
        }
        
        var lastNode = head
        while lastNode?.reference() != nil {
            lastNode = lastNode?.reference()
        }
        
        return lastNode
    }
}
