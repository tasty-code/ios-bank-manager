final class Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    func enqueue(_ Node: Node<T>) {
        if head == nil {
            head = Node
            tail = Node
        } else {
            tail?.next = Node
            tail = Node
        }
    }
    
    func dequeue() -> T? {
        let Node: Node<T>? = head
        if head == nil {
            return nil
        }
        
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return Node?.data
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
