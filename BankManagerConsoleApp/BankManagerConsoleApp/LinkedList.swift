
import Foundation

final class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    deinit { print("Node has benn deinit.") }
}

final class LinkedList {
    
    private var head: Node?
    
}

// MARK: - Methods
extension LinkedList {
    
    /// Add
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head ?? nil
        
        while(node?.next != nil) {
            node = node?.next ?? nil
        }
    }
    
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        for _ in 0..<position-1 {
            currentNode = currentNode?.next ?? nil
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    /// Get
    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        var node = head ?? nil
        
        while(node?.next != nil) {
            node = node?.next ?? nil
        }
        return node?.data
    }
    
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head?.data
    }

    /// Remove
    func removeFirst() {
        head = head?.next
    }
    
    func removeLast() {
        var nextNode = head
        var previousNode: Node?
        
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
        var previousNode: Node?
        
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }
    
    func removeAll() {
        head = nil
    }
    
    /// Validate
    func isEmpty() -> Bool {
        return head == nil
    }
}
