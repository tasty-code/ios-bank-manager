final class Bank {
    private var queueManager: QueueManager
    private var bankers: [Banker]
    private var customerCount: Int
    
    init(queueManager: QueueManager = QueueManager(), bankers: [Banker] = [], customerCount: Int = 0) {
        self.queueManager = queueManager
        self.bankers = bankers
        self.customerCount = customerCount
    }
    
    func hireBanker(_ task: String) {
        let banker: Banker = Banker(id: bankers.count, task: task)
        bankers.append(banker)
    }
    
    func greetCustomer() {
        customerCount = Int.random(in: 10...30)
        let queue = queueManager.getQueue()
        
        for _ in 1...customerCount {
            let newCustomer = Customer(id: queue.getAccumulatedCount())
            queue.enqueue(newCustomer)
        }
    }
    
    func startWork() {
        let queue = queueManager.getQueue()
        
        for _ in 1...customerCount {
            for banker in bankers {
                if banker.task == Task.deposit.description {
                    banker.work(queue)
                }
            }
        }
    }
    
    func prepareWork() {
        hireBanker(Task.deposit.description)
        greetCustomer()
        startWork()
    }
    
    func prepareCloseWork() -> Int {
        queueManager.clearQueue()
        return customerCount
    }
}

