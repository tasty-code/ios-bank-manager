
final class Node<T> {
    private(set) var data: T?
    private(set) var next: Node<T>?
    
    init(data: T? = nil, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
    
    func updateData(data: T?) {
         self.data = data
    }
    
    func updateNext(next: Node<T>?) {
         self.next = next
    }
}
