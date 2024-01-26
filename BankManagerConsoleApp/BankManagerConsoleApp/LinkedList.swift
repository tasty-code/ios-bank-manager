
class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
    
    func push(with data: T) {
        head = Node(data: data, next: head)
        count += 1
        if tail == nil {
            tail = head
        }
    }
    
    func append(with data: T) {
        guard isEmpty == false else {
            push(with: data)
            return
        }
        
        tail?.next = Node(data: data)
        count += 1
        tail = tail?.next
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
