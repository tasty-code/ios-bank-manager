import Foundation

final class Queue<T> {
    
    private let likeList = LinkedList<T>()
}

// MARK: - Queue Method
extension Queue {
    
    func enqueue(data: T) {
        likeList.appendLastNode(data: data)
    }
    
    func dequeue() {
        likeList.removeFirstNode()
    }
    
    func clear() {
        likeList.clearNode()
    }
    
    func peek() -> T? {
        return likeList.peekNode()
    }
    
    func isEmpty() -> Bool {
        return likeList.isEmpty()
    }
}
