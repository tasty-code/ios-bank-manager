
import Foundation

class Queue<T: Equatable> {
    var delegate: BankManager?
    private let linkedList: LinkedList<T>
    
    init(linkedList: LinkedList<T>) {
        self.linkedList = linkedList
    }
    
    func isEmpty() -> Bool {
        return linkedList.count == 0
    }
    
    func enqueue(node: Node<T>) {
        DispatchQueue.main.async {
            self.delegate?.setWaitingCustomer()
        }
        linkedList.add(node)
    }
    
    @discardableResult
    func dequeue() -> Node<T>? {
        DispatchQueue.main.async {
            self.delegate?.setWaitingCustomer()
        }
        guard let firstNode = linkedList[0] else {
            return nil
        }
        return linkedList.remove(firstNode)
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
    
    func getNodeValue(at index: Int) -> T? {
        return linkedList[index]?.value
    }
}
