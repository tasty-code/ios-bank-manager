//
//  DoublyLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/25/24.
//

//MARK: - Node.swift
final class Node<T> {
    var value: T
    var previous: Node?
    var next: Node?
    
    init(value: T, previous: Node? = nil, next: Node? = nil) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}


//MARK: - LinkedList.swift
final class LinkedList<T> {
    
    //MARK: - Properties
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var size: Int = 0
    
    
    //MARK: - Methods
    func append(value: T) {
        let newNode = Node(value: value)
        
        if isEmpty() {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode  // newNode와 tail을 연결
            newNode.previous = tail
            tail = newNode  // tail을 새롭게 설정
        }
        size += 1
    }
    
    func insert(value: T, at index: Int) {
        guard index >= 0 else { return }  // index가 음수인 경의 처리
        
        let newNode = Node(value: value)

        if index == 0 || isEmpty() {
            newNode.next = head
            head?.previous = newNode
            head = newNode
            if tail == nil {
                tail = head
            }
        } else if index >= size {
            append(value: value)
        } else {
            let half = size / 2
            let isForward = (index <= half)
            
            var node: Node<T>?
            if isForward {
                node = head
                for _ in 0..<index {
                    node = node?.next
                }
            } else {
                node = tail
                for _ in 0..<(size - index - 1) {
                    node = node?.previous
                }
            }

            newNode.next = node?.next
            newNode.previous = node
            node?.next?.previous = newNode
            node?.next = newNode

            size += 1
        }
    }
    
    func removeAll() {
        head = nil
        tail = nil
        
        size = 0
    }
    
    func removeFirst() -> T? {
        guard let currentHead = head else { return nil }
        
        head = currentHead.next
        head?.previous = nil
        size -= 1
        
        if isEmpty() {
            tail = nil
        }
        
        return currentHead.value
    }
    
    func removeLast() -> T? {
        guard let currentTail = tail else { return nil }
        
        tail = currentTail.previous
        tail?.next = nil
        size -= 1
        
        if isEmpty() {
            head = nil
        }
        
        return currentTail.value
    }
    
    func remove(at index: Int) -> T? {
        guard !isEmpty(), index >= 0, index < size else { return nil }
        
        if index == 0 {
            return removeFirst()
        } else if index == size - 1 {
            return removeLast()
        } else {
            let half = size / 2
            let isForward = (index < half)
            
            var node: Node<T>?
            if isForward {
                node = head
                for _ in 0..<index {
                    node = node?.next
                }
            } else {
                node = tail
                for _ in 0..<(size - index - 1) {
                    node = node?.previous
                }
            }
            
            node?.previous?.next = node?.next
            node?.next?.previous = node?.previous
            
            size -= 1
            
            if isEmpty() {
                head = nil
                tail = nil
            }
            
            return node?.value
        }
    }
    
    func peek() -> T? {
        return head?.value
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
}


//MARK: - LinkedListQueue.swift
struct DoublyLinkedListQueue<T>: QueueProtocol {
    
    // MARK: - Properties
    private var queue: LinkedList<T>
    private var size: Int {
        queue.size
    }
    
    init() {
        self.queue = LinkedList<T>()
    }
}


// MARK: - Extension
extension DoublyLinkedListQueue {
    func enqueue(_ element: T) {
        queue.append(value: element)
    }
    
    func dequeue() -> T? {
        return isEmpty() ? nil : queue.removeFirst()
    }
    
    func clear() {
        queue.removeAll()
    }
    
    func peek() -> T? {
        return queue.peek()
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty()
    }
}
