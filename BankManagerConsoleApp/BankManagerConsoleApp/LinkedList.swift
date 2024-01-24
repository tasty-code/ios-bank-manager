import Foundation

class LinkedList<T> {
    var head: Node<T>?
    var rear: Node<T>?
    
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
}
