import Foundation

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func appendNode(value: T) {
        let newNode = Node(value: value)
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
        }
    }
    
    func removeFirst() {
        if isEmpty {
            print("리스트가 비어있습니다")
        } else {
            head = head?.next
        }
    }
    
    func headValue() -> T? {
        return head?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
}
