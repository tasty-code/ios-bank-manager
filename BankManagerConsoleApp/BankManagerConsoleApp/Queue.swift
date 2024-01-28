
struct Queue<T> {
    private var linkedList: LinkedList<T> = LinkedList()
    private(set) var isEmpty: Bool {
        get { return linkedList.isEmpty }
        set { }
    }
    
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
