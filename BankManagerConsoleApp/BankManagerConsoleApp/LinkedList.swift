import Foundation

class LinkedList<T> {
    private var head: Node<T>?
    private var rear: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func appendNode(value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        } else {
            var previousNode = head
            while previousNode != nil {
                previousNode = previousNode?.next
            }
            previousNode?.next = newNode
        }
    }
    
    func headValue() -> T? {
        return head?.value
    }
}
