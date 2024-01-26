final class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

final class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(data: T) {
        let newNode = Node(data: data)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func insert(data: T, at index: Int) {
        let newNode = Node(data: data)
        if index == 0 {
            newNode.next = head
            head = newNode
            if tail == nil {
                tail = newNode
            }
        } else {
            var current = head
            for _ in 0..<(index - 1) {
                current = current?.next
            }
            if current == nil {
                append(data: data)
                return
            }
            newNode.next = current?.next
            current?.next = newNode
        }
    }
    
    private func removeFirst() -> T? {
        if let headNode = head {
            head = headNode.next
            if head == nil {
                tail = nil
            }
            return headNode.data
        } else {
            return nil
        }
    }
    
    func remove(at index: Int) -> T? {
        if head == nil { return nil }
        if index == 0 {
            return removeFirst()
        }
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next?.next == nil { break }
            node = node?.next
        }
        let removedNode = node?.next
        node?.next = node?.next?.next
        return removedNode?.data
    }
}
