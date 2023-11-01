import Foundation


let bankManager = BankManager<Int>()
bankManager.makeQueue()
bankManager.hireBanker(task: Task.deposit.description)
let queue = bankManager.getQueue(index: 0)

let peopleCount = Int.random(in: 10...30)
for index in 1...peopleCount {
    queue?.enqueue(Node(data: index))
}
for index in 1...peopleCount {
    bankManager.startWork()
}
