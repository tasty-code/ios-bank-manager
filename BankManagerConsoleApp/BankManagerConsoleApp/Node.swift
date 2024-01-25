import Foundation

final class Node<T> {
    var value: T?
    var next: Node?
    
    init(value: T? = nil, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    deinit { print("노드 해제됨") }
}
