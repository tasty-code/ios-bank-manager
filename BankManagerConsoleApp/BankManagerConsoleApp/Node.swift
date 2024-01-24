
import Foundation

class Node<T: Equatable> {
    private let _value: T
    var value: T {
        return _value
    }
    
    private(set) var next: Node?
    
    init(value: T, next: Node? = nil) {
        self._value = value
        self.next = next
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }

    public func refer(to node: Node?) {
        next = node
    }
}
