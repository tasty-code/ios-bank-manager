import Foundation

final class BankManager<T> {
    private var queues: [Queue<T>]
    
    init(queues: [Queue<T>] = []) {
        self.queues = queues
    }
    
    func makeQueue() {
        let queue: Queue<T> = Queue<T>()
        queues.append(queue)
    }
    
    func getQueue(index: Int) -> Queue<T> {
        return queues[index]
    }
}

final class Queue<T> {
    private var head: Person<T>?
    private var tail: Person<T>?
    
    init(head: Person<T>? = nil, tail: Person<T>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    func enqueue(_ person: Person<T>) {
        if head == nil {
            head = person
            tail = person
        } else {
            tail?.next = person
            tail = person
        }
    }
    
    func dequeue() -> T? {
        let toDequeuePerson: Person<T>? = head
        if head == nil {
            return nil
        }
        
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return toDequeuePerson?.data
    }
    
    func clear() {
        head = nil
        tail = nil
    }
    
    func peek() -> T? {
        return head?.data
    }

    func isEmpty() -> Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
}

final class Person<T> {
    let data: T
    var next: Person<T>?
    
    init(data: T, next: Person<T>? = nil) {
        self.data = data
        self.next = next
    }
}
