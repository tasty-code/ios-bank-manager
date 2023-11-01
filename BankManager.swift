import Foundation

final class BankManager<T> {
    private var queues: [Int: Queue<T>]
    private var bankers: [Banker<T>]

    init(queues: [Int: Queue<T>] = [:], bankers: [Banker<T>] = [] ) {
        self.queues = queues
        self.bankers = bankers
    }
    
    func startWork() {
        guard let queue = queues[0] else {
            return
        }
        
        for banker in bankers {
            if banker.task == "예금" {
                banker.takeTask(queue)
            }
        }
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
    
    func hireBanker(task: String) {
        let banker: Banker<T> = Banker(id: bankers.count, task: task)
        bankers.append(banker)
    }
}
