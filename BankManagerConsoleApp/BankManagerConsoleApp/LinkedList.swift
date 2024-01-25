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
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func removeFirst() {
        if isEmpty {
            print("리스트가 비어있습니다")
        } else {
            head = head?.next
        }
    }
    
    func clear() {
        head = nil
        tail = nil
    }
}
