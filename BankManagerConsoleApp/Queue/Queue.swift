
struct Queue<T: Equatable> {
    private(set) var linkedList: LinkedList<T> = LinkedList()
    var isEmpty: Bool { linkedList.isEmpty }
    
    mutating func enqueue(with item: T) {
        linkedList.appendNodeAtRear(with: item)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeNodeFromFront()
    }
    
    mutating func clean() {
        linkedList.clean()
    }
    
    func peek() -> T? {
        return linkedList.peek()
    }
    
    func totalLength() -> Int {
        return linkedList.count
    }
}
