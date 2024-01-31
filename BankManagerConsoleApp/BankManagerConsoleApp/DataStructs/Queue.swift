protocol Queue {
    associatedtype Element
    var isEmpty: Bool { get }
    
    func enqueue(_ element: Element)
    func dequeue() -> Element?
    func clear()
    func peek() -> Element?
}
