import Foundation

final class Queue<T> {
    private var head: Person<T>?;
    
    init(head: Person<T>) {
        self.head = head
    }
    
    func enqueue(person: Person<T>) {
    }
    
    func dequeue() -> Person<T>? {
        var currentHead: Person<T>?
        if head == nil {
            return nil
        }
        
        currentHead = head
        head = head?.next
        return currentHead
    }
    
    func clear() {
        
    }
    
    func peek() {
        
    }
    
    func isEmpty() {
        
    }
}

final class Person<T> {
    let data: T
    var next: Person<T>?
    
    init(data: T, next: Person) {
        self.data = data
        self.next = next
    }
}
