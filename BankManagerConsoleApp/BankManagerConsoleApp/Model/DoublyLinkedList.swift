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
        
        if head == nil || tail == nil {
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
        let newNode = Node(value: value)

        if isEmpty() { //head가 비어있으면 head로 설정
            head = newNode
            tail = head

            size += 1
            return
        } else if index <= 0 { //head에 추가
            newNode.next = head
            head?.previous = newNode
            head = newNode

            size += 1
            return
        } else if index >= size { //tail에 추가
            append(value: value)
            return
        } else { //중간 삽입
            let half = size / 2
            let isForward = (index <= half)

            var node: Node<T>?
            if isForward {
                node = head
                for _ in 0..<index - 1 {
                    guard let next = node?.next else { break }
                    node = next
                }
            } else {
                node = tail
                for _ in 0..<(size - index) {
                    guard let previous = node?.previous else { break }
                    node = previous
                }
            }

            node?.next?.previous = newNode
            newNode.next = node?.next

            newNode.previous = node
            node?.next = newNode

            size += 1
            return
        }
    }
    
    func removeAll() {
        head = nil
        tail = nil
        
        size = 0
    }
    
    func removeFirst() -> T? {
        guard let _ = head else { return nil }
        
        head = head?.next
        head?.previous = nil
        
        size -= 1
        if isEmpty() {
            head = nil
            tail = nil
        }
        return head?.value
    }
    
    func removeLast() -> T? {
        guard let _ = tail else { return nil }
        
        tail = tail?.previous
        tail?.next = nil
        
        size -= 1
        if isEmpty() {
            head = nil
            tail = nil
        }
        return tail?.value
    }
    
//    func remove(at index: Int) -> T? {
//        if isEmpty() {
//            return nil
//        } else if index <= 0 { //head 삭제
//            return removeFirst()
//        } else if index >= size { //tail 삭제
//            return removeLast()
//        } else {
//            let half = size / 2
//            let isForward = (index <= half)
//
//            var node: Node<T>?
//            if isForward {
//                node = head
//                for _ in 0..<index {
//                    guard let next = node?.next else { break }
//                    node = next
//                }
//            } else {
//                node = tail
//                for _ in 0..<(size - index - 1) {
//                    guard let previous = node?.previous else { break }
//                    node = previous
//                }
//            }
//
//            node?.previous?.next = node?.next
//            node?.next?.previous = node?.previous
//
//            size -= 1
//            return node?.value
//        }
//
//        if isEmpty() {
//            head = nil
//            tail = nil
//        }
//
//        return
//    }
    
    func peek() -> T? {
        return head?.value
    }
    
    func isEmpty() -> Bool {
        return head == nil || tail == nil
    }
    
//    func fetchSize() -> Int {
//        return size
//    }
}


//MARK: - Queue.swift
protocol Queue {
    associatedtype Element
    func enqueue(_ element: Element)
    func dequeue() -> Element?
    func clear()
    func peek() -> Element?
    func isEmpty() -> Bool
}


//MARK: - LinkedListQueue.swift
struct DoublyLinkedListQueue<T>: Queue {
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
