
import Foundation

class LinkedList<T: Equatable> {
    private var _head: Node<T>? {
        didSet {
            if _head == nil {
                _count = 0
            }
        }
    }
    var head: Node<T>? {
        get {
            return _head
        } set(node) {
            _head = node
        }
    }
    
    private var _count: Int
    var count: Int {
        return _count
    }
    
    init(head: Node<T>? = nil) {
        self._head = head
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
        
        var nextNode: Node<T>? = head?.next

        for _ in 1...index {
            guard let next = nextNode?.next else {
                return nil
            }
            nextNode = next
        }
        return nextNode
    }
    
    public func findPreviousNode(of node: Node<T>) -> Node<T>? {
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
    
    public func add(_ node: Node<T>) {
        if _head == nil {
            _head = node
            _count += 1
            return
        }
        
        let lastNode = getNode(index: _count - 1)
        lastNode?.next = node
        _count += 1
    }
    
    public func add(_ node: Node<T>, after referenceNode: Node<T>) {
        if let temporaryNode = referenceNode.next {
            node.next = temporaryNode
        }
        
        referenceNode.next = node
        _count += 1
    }
    
    public func removeNode(_ node: Node<T>) {
        let previousNode = findPreviousNode(of: node)
        
        if let nextNode = node.next {
            previousNode?.next = nextNode
        } else {
            previousNode?.next = nil
        }
      
        _count -= 1
    }
}
