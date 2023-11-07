final class Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var accumulatedCount: Int
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil, accumulatedCount: Int = 0) {
        self.head = head
        self.tail = tail
        self.accumulatedCount = accumulatedCount
    }
    
    func enqueue(_ data: T) {
        let node = Node<T>(data: data)
        
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
        accumulatedCount += 1
    }
    
    func dequeue() {
        if head != nil {
            head = head?.next
        }
        
        if head == nil {
            tail = nil
        }
    }
    
    func clear() {
        head = nil
        tail = nil
        accumulatedCount = 0
    }
    
    func peek() -> T? {
        return head?.data
    }

    func isEmpty() -> Bool {
        if head == nil && tail == nil {
            return true
        } else {
            return false
        }
    }
    
    func getAccumulatedCount() -> Int {
        return accumulatedCount
    }
}
