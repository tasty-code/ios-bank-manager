protocol QueueProtocol {
    associatedtype Element
    
    var isEmpty: Bool { get }
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    mutating func clear()
    func peek() -> Element?
}

final class Queue<Element>: QueueProtocol {
    typealias Element = Element
    
    private var container = LinkedList<Element>()
    
    var isEmpty: Bool {
        return self.container.isEmpty
    }
    
    func enqueue(_ element: Element) {
        self.container.enqueue(element)
    }
    
    func dequeue() -> Element? {
        return self.container.dequeue()
    }
    
    func clear() {
        self.container.clear()
    }
    
    func peek() -> Element? {
        self.container.peek()
    }
    func check() -> [Element] {
        self.container.getAllElements()
    }
}
