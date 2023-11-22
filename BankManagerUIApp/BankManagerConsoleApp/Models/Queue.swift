final class Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
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
    }
    
    @discardableResult
    func dequeue() -> T?{
        let toDequeue = head?.data
        if head != nil {
            head = head?.next
        }
        
        if head == nil {
            tail = nil
            
        }
        return toDequeue
    }
    
    func clear() {
        head = nil
        tail = nil
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
    
}


