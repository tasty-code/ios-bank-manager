
import Foundation

struct Queue<T: Equatable> {
    var linkedList: LinkedList<T>?
    
    func isEmpty() -> Bool {
        return linkedList?.count == 0
    }
    
    func enqueue(node: Node<T>) {
        linkedList?.add(node)
    }
    
    func dequeue() {
        linkedList?.head = linkedList?.head?.next
    }
    
    func peek() -> Node<T>? {
        return linkedList?.head
    }
    
    func clear() {
        linkedList?.head = nil
    }
}
