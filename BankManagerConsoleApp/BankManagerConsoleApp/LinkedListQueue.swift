import Foundation

class LinkedListQueue<Element>: Queue {
    private var queue: LinkedList<Element> = LinkedList()
    private var count: Int = 0
    var isEmpty: Bool = true
    
    func enqueue(element: Element) {
        queue.append(data: element)
    }
    
    func dequeue() -> Element? {
        
    }
    
    func clear() {
        
    }
    
    func peek() -> Element? {
        
    }
    
    
}
