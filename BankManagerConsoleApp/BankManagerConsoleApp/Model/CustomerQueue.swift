//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Jin-Mac on 1/25/24.
//

struct CustomerQueue<T: Equatable> {
    var list = LinkedList<T>()
    
    mutating func enqueue(value: T) {
        list.append(value: value)
    }
    
    mutating func dequeue() -> T? {
        let result = list.remove(at: 0)
        return result?.value
    }
    
    func peek() -> T? {
        return list.first()?.value
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty()
    }
}
