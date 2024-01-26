
class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
    
    func appendNodeAtRear(with data: T) {
        if isEmpty {
            tail = Node(data: data)
            head = tail
            count += 1
            return
        }
        tail?.next = Node(data: data)
        tail = tail?.next
        count += 1
    }
    
    func removeNodeFromFront() -> T? {
        let removedNode = head
        if isEmpty {
            tail = nil
            count = 0
            return nil
        }
        head = head?.next
        count -= 1
        return removedNode?.data
    }
    
    func clean() {
        head = nil
        tail = nil
        count = 0
    }
    
    func peek() -> T? {
        head?.data
    }
}
