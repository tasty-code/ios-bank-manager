import Foundation

class LinkedListQueue<Element>: Queue {
    private var queue: LinkedList<Element> = LinkedList()
    var isEmpty: Bool = true
    
    func enqueue(element: Element) {
        queue.append(data: element)
    }
    
    func dequeue() -> Element? {
        return queue.remove(at: 0)
    }
    
    func clear() {
        queue.head = nil
        queue.tail = nil
    }
    
    func peek() -> Element? {
        return queue.tail?.data
    }
    
}
