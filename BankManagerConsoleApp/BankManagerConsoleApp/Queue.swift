import Foundation


final class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

final class Queue<T> {
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
    
    func dequeue() -> T? {
        let node = head
        head = head?.next
        return node?.data
    }
    
    func clear() {
        head = nil
    }
    
    func peek() -> T? {
        return head?.data
    }
    
    func isEmpty() -> Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }

}
