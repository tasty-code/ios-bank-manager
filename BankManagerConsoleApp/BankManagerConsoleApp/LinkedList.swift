
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
    
    func pop() -> T? {
        let returnValue = head?.data
        head = head?.next
        if isEmpty {
            tail = nil
            count = 0
            return nil
        }
        count -= 1
        return returnValue
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
