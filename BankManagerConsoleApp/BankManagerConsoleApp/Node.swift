import Foundation

class Node<T> {
    var value: T?
    var next: Node?
    
    init(value: T? = nil, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
