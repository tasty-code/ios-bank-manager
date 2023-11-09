final class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<Value> {
    private var head: Node<Value>?
    private var tail: Node<Value>?
    
    /// 리스트의 머리에 노드를 추가하기
    mutating func push(_ value: Value) {
        self.head = Node(value: value)
        self.tail = self.head
    }
    
    /// 리스트의 머리에서 노드를 삭제하기
    mutating func pop() -> Value? {
        let value = self.head?.value
        self.head = self.head?.next
        if self.isEmpty { self.tail = nil }
        return value
    }
    
    /// 리스트의 꼬리에 노드를 추가하기
    mutating func append(_ value: Value) {
        guard self.isEmpty == false else {
            self.push(value)
            return
        }
        
        self.tail?.next = Node(value: value)
        self.tail = self.tail?.next
    }
}

// MARK: QueueProtocol Conformance
extension LinkedList: QueueProtocol {
    typealias Element = Value
    
    var isEmpty: Bool {
        self.head == nil
    }
    
    mutating func enqueue(_ value: Value) {
        self.append(value)
    }
    
    mutating func dequeue() -> Value? {
        return self.pop()
    }
    
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
    
    func peek() -> Value? {
        return self.head?.value
    }
}

// MARK: 공부용으로 만듬
extension LinkedList {
    func getAllElements() -> [Value] {
        var result = [Value]()
        var indicator = head
        while indicator != nil {
            if let value = indicator?.value {
                result.append(value)
                indicator = indicator?.next
            }
        }
        return result
    }
}
