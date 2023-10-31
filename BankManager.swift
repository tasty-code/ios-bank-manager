import Foundation

final class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    deinit {
        print("\(data)끝")
    }
}

final class LinkedList<T> {
    private var head: Node<T>?
    
    func enqueue(data: T) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = Node(data: data)
    }
    
    func dequeue() -> Node<T>? {
        let outNode = head
        head = head?.next
        return outNode
    }
    
    func clear() {
        head = nil
    }
    
    func peek() -> T? {
        return head?.data
    }
    
    func isEmpthy() -> Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }

}
