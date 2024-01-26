import Foundation

final class LinkedListQueue<Element>: Queue {
    private var queue: LinkedList<Element> = LinkedList()
    private var count: Int = 0
    var isEmpty: Bool {
        return self.count == 0
    }
    
    func enqueue(element: Element) {
        count += 1
        queue.append(data: element)
    }
    
    func dequeue() -> Element? {
        if count > 0 {
            count -= 1
        }
        return queue.remove(at: 0)
    }
    
    func clear() {
        count = 0
        queue.head = nil
        queue.tail = nil
    }
    
    func peek() -> Element? {
        return queue.head?.value()
    }
    
}
