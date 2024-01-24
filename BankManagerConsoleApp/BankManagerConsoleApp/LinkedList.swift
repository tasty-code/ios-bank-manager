
import Foundation

class LinkedList<T: Equatable> {
    private var head: Node<T>? {
        didSet {
            if head == nil {
                _count = 0
            }
        }
    }
    
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
            _count += 1
            return
        }
        
        let lastNode = getNode(index: _count - 1)
        lastNode?.refer(to: newNode)
        _count += 1
    }
    
    public func add(_ newNode: Node<T>, after previousNode: Node<T>) {
        if let temporaryNode = previousNode.reference() {
            newNode.refer(to: temporaryNode)
        }
        
        previousNode.refer(to: newNode)
        _count += 1
    }
    
    public func remove(_ node: Node<T>) {
        let previousNode = findPreviousNode(of: node)
        
        if let nextNode = node.reference() {
            previousNode?.refer(to: nextNode)
        } else {
            previousNode?.refer(to: nil)
        }
      
        _count -= 1
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
            
        for _ in 1..._count {
            if let reference = nextNode?.reference(), reference == node {
                return nextNode
            }
            nextNode = nextNode?.reference()
        }
        
        return nil
    }
}
