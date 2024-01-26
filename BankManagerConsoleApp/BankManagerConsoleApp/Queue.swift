
import Foundation

struct Queue<T: Equatable> {
    private let linkedList: LinkedList<T>
    
    init(linkedList: LinkedList<T>) {
        self.linkedList = linkedList
    }
    
    func isEmpty() -> Bool {
        return linkedList.count == 0
    }
    
    func enqueue(node: Node<T>) {
        linkedList.add(node)
    }
    
    func dequeue() {
        guard let firstNode = linkedList[0] else {
            return
        }
        linkedList.remove(firstNode)
    }
    
    func peek() -> Node<T>? {
        return linkedList[0]
    }
    
    func clear() {
        linkedList.removeAll()
    }
    
    func count() -> Int {
        return linkedList.count
    }
    
    func customerNumber(at index: Int) -> T? {
        return linkedList[index]?.value
    }
}
