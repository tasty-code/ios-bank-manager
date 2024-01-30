import Foundation

final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    var headValue: T? {
        return head?.value
    }
    
    func appendNode(value: T) {
        let newNode = Node(value: value)
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    func removeFirst() -> T? {
        guard let currentHead = head else {
            tail = nil
            return nil
        }
        head = currentHead.next
        return currentHead.value
        }
    func clear() {
        head = nil
        tail = nil
    }
}
