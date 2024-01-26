//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let queue: Queue<String> = Queue()

print("1️⃣ queue.isEmpty: \(queue.isEmpty())")

queue.enqueue(with: "A")
queue.enqueue(with: "B")
queue.enqueue(with: "C")
print("2️⃣ queue.enqueue")
dump(queue)
print("3️⃣ queue.totalLength: \(queue.totalLength())")

if let dequeuedItem = queue.dequeue() {
    print("4️⃣ queue.dequeue: \(dequeuedItem)")
    dump(queue)
    print("5️⃣ queue.totalLength: \(queue.totalLength())")
}

if let peekedItem = queue.peek() {
    print("6️⃣ queue.peek: \(peekedItem)")
    dump(queue)
}

print("7️⃣ queue.isEmpty: \(queue.isEmpty())")

queue.clean()
print("8️⃣ queue.isEmpty: \(queue.isEmpty())")



