import Foundation

final class BankManager<T> {
    private var queues: [Int:Queue<T>]
    
    init(queues: [Int:Queue<T>] = [:]) {
        self.queues = queues
    }
    
    func makeQueue() {
        let queue: Queue<T> = Queue<T>()
        queues[queues.count] = queue
    }
    
    func getQueue(index: Int) -> Queue<T>? {
        if queues.count > 0 {
            return queues[index]
        } else {
            return nil
        }
    }
}
