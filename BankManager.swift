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
