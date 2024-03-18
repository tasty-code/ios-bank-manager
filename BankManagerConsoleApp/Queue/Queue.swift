
class Queue<T: Equatable> {
    private(set) var linkedList: LinkedList<T> = LinkedList()
    var isEmpty: Bool { linkedList.isEmpty }
    
    func enqueue(with item: T) {
        linkedList.appendNodeAtRear(with: item)
    }
    
    func dequeue() -> T? {
        return linkedList.removeNodeFromFront()
    }
    
    func clean() {
        linkedList.clean()
    }
    
    func peek() -> T? {
        return linkedList.peek()
    }
    
    func totalLength() -> Int {
        return linkedList.count
    }
}
