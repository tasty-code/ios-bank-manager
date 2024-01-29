import Foundation

final class Queue<T> {
    
    private let linkedList = LinkedList<T>()
}

// MARK: - Queue Method
extension Queue {
    
    func enqueue(data: T) {
        linkedList.appendNode(data: data)
    }
    
    func dequeue() {
        linkedList.removeFirstNode()
    }
    
    func clear() {
        linkedList.clearNode()
    }
    
    func peek() -> T? {
        return linkedList.peekNode()
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
}
