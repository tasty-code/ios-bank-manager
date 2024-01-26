
class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
