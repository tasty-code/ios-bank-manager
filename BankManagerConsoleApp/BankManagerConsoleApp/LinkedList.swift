
struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0
    private(set) var isEmpty: Bool {
        get { return head == nil }
        set { }
    }
    
    mutating func appendNodeAtRear(with data: T) {
        if isEmpty {
            tail = Node(data: data)
            head = tail
            count += 1
            return
        }
        tail?.updateNext(next: Node(data: data))
        tail = tail?.readNext()
        count += 1
    }
    
    mutating func removeNodeFromFront() -> T? {
        let removedNode = head
        if isEmpty {
            tail = nil
            count = 0
            return nil
        }
        head = head?.readNext()
        count -= 1
        return removedNode?.readData()
    }
    
    mutating func clean() {
        head = nil
        tail = nil
        count = 0
    }
    
    func peek() -> T? {
        head?.readData()
    }
}
