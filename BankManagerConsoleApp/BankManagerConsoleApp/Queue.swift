
class Queue<T> {
    private let linkedList: LinkedList<T> = LinkedList()
    
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
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty
    }
    
    func totalLength() -> Int {
        return linkedList.count
    }
}
