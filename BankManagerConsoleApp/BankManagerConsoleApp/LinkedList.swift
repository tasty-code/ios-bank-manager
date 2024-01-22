
import Foundation

final class Node<T> {
    var data: T
    var next: Node?
    
    init(_ data: T, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    deinit { print("Node has been deinitialized.") }
}

final class LinkedList<T> {
    
    private var head: Node<T>?
    
    var isEmpty: Bool  {
        return head == nil ? true : false
    }
}

// MARK: - Methods
extension LinkedList {
    
    /// Add
    func addFront(_ data: T) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    func addBack(_ data: T) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head
        
        while(node?.next != nil) {
            node = node?.next
        }
        node?.next = newNode
    }
    
    func insert(position: Int, data: T) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        for _ in 0..<position-1 {
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    /// Get
    func getLast() -> T? {
        if head == nil {
            return nil
        }
        var node = head
        
        while(node?.next != nil) {
            node = node?.next
        }
        return node?.data
    }
    
    func getFirst() -> T? {
        return head?.data
    }

    /// Remove
    func removeFirst() {
        head = head?.next
    }
    
    func removeLast() {
        var nextNode = head
        var previousNode: Node<T>?

        while(nextNode?.next != nil) {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    func remove(at position: Int) {
        if position == 0 {
            self.removeFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node<T>?
        
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }
    
    func removeAll() {
        head = nil
    }
}
