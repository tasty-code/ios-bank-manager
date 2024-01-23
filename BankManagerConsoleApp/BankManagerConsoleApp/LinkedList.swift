import Foundation

class ListNode<T> {
    var value: T
    var next: ListNode?

    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: ListNode<T>?
    var tail: ListNode<T>?

    var isEmpty: Bool {
        return head == nil
    }
    
    //tail노드 찾고 없으면 추가 -> 마지막에 추가함
    func append(value: T) {
        let newNode = ListNode(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    func removeFirst() -> T? {
        if let headNode = head {
            head = headNode.next
            if isEmpty {
                tail = nil
            }
            return headNode.value
        } else {
            return nil
        }
    }
}
