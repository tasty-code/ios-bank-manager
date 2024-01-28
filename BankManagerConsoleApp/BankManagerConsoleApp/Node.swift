
final class Node<T> {
    private var data: T?
    private var next: Node<T>?
    
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
    
    func readData() -> T? {
        return self.data
    }
    
    func readNext() -> Node<T>? {
        return self.next
    }
}
