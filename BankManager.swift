import Foundation

final class Queue<T> {
    private var head: Person<T>?;
    
    init(head: Person<T>) {
        self.head = head
    }
    
    func enqueue(person: Person<T>) {
//        if peek()
    }
    
    func dequeue() {
 
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
    var next: Person?
    
    init(data: T, next: Person) {
        self.data = data
        self.next = next
    }
}
