
class Queue<T> {
    private let linkedList: LinkedList<T> = LinkedList()
    private(set) var isEmpty: Bool {
        get { return linkedList.isEmpty }
        set { }
    }
    
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
