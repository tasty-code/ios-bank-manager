import Foundation

final class Queue<T> {
    private var linkedList = LinkedList<T>()
    var peek: T? {
        return linkedList.head?.value
    }
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    func enqueue(value: T) {
        linkedList.appendNode(value: value)
    }
    
    func dequeue() {
        linkedList.removeFirst()
    }
    
    func clear() {
        linkedList.clear()
    }
}
