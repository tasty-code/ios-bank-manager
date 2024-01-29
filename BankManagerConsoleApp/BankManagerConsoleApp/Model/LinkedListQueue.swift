//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/25/24.
//

final class LinkedListQueue<T>: QueueProtocol {
    private var elements: LinkedList<T>
    
    /// 큐에 맨 앞을 확인
    public var peek: T? {
        return elements.peek
    }
    /// 큐가 비어 있는지 확인
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    init() {
        self.elements = LinkedList<T>()
    }
    
    /// 큐에 요소를 추가
    public func enqueue(_ element: T) {
        elements.append(data: element)
    }
    
    /// 큐에서 첫 번째 요소를 제거하고 반환
    public func dequeue() -> T? {
        elements.removeFirst()
    }
    
    /// 큐의 모든 요소를 제거
    public func clear() {
        elements.removeAll()
    }
    
    /// LinkedList의 개별 요소 나타냄
    final class Node<U> {
        var data: U
        var next: Node<U>?
        
        init(data: U, next: Node<U>? = nil) {
            self.data = data
            self.next = next
        }
    }
    
    /// LinkedList 클래스는 Queue를 구현하기 위한 연결 리스트
    private final class LinkedList<U> {
        private var head: Node<U>?
        private var tail: Node<U>?
        
        /// 리스트가 비어 있는지 확인
        var isEmpty: Bool {
            return head == nil
        }
        
        /// head의 값을 확인
        var peek: U? {
            return head?.data
        }
        
        /// 새로운 요소를 추가
        func append(data: U) {
            let newNode = Node(data: data)
            
            if let tailNode = tail {
                tailNode.next = newNode
            } else {
                head = newNode
            }
            tail = newNode
        }

        /// 첫 번째 요소를 제거
        func removeFirst() -> U? {
            let firstNodeData = head?.data
            head = head?.next
            if head == nil {
                tail = nil
            }
            return firstNodeData
        }

        /// 리스트의 모든 요소를 제거
        func removeAll() {
            head = nil
            tail = nil
        }
    }
}
