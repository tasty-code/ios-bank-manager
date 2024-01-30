import Foundation

final class LinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
}

// MARK: - LinkedList Method
extension LinkedList {
    
    func appendNode(data: T) {
        let newNode = Node(value: data)
        
        if head == nil || tail == nil {
            head = newNode
            tail = head
            return
        }
        
        tail?.formNext(newNode)
        newNode.formPrev(tail)
        tail = newNode
    }
    
    func clearNode() {
        self.head = nil
        self.tail = nil
    }
    
    func removeFirstNode(){
        if head == nil || tail == nil {
            tail = nil
            return
        }
        
        let deleteNode = head
        head = deleteNode?.fetchNext()
        head?.formPrev(nil)
        
        tail = isEmpty() ? head : tail
    }
    
    func peekNode() -> T? {
        return head?.fetchValue()
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
}
