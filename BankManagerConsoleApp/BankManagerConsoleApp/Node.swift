
class Node<T> {
    var data: T?
    var next: Node<T>?
    
    init(data: T? = nil, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
