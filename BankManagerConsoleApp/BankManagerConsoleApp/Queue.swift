
class Queue<T> {
    var queue: LinkedList<T> = LinkedList()
    
    func enqueue(with item: T) {
        queue.appendNodeAtRear(with: item)
    }
    
    func dequeue() -> T? {
        return queue.removeNodeFromFront()
    }
    
    func clean() {
        queue.clean()
    }
    
    func peek() -> T? {
        return queue.peek()
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func totalLength() -> Int {
        return queue.count
    }
}
