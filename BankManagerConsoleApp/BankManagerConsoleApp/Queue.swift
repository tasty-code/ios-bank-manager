protocol Queue {
    associatedtype Element
    var isEmpty: Bool { get }
    
    func enqueue(element: Element)
    func dequeue() -> Element?
    func clear()
    func peek() -> Element?
}
