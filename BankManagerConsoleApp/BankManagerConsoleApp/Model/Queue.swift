import Foundation

final class Queue<T> {
    private var linkedList = LinkedList<T>()
    private(set) var count = 0
    
    var peek: T? {
        return linkedList.head?.value
    }
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    func enqueue(value: T) {
        linkedList.appendNode(value: value)
        count += 1
    }
    
    func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    func clear() {
        linkedList.clear()
        count = 0
    }
}
