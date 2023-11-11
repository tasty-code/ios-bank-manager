import Foundation

final class Bank {
    private var queueManager: QueueManager
    private var banker: Banker
    private var customerCount: Int
    private var elapsedTime: Double
    
    init(queueManager: QueueManager = QueueManager(), banker: Banker = Banker(), customerCount: Int = 0, timeElapsed: Double = 0.0) {
        self.queueManager = queueManager
        self.banker = banker
        self.customerCount = customerCount
        self.elapsedTime = timeElapsed
    }
    
    func prepareWork() {
        greetCustomer()
        openBank()
    }
    
    func prepareCloseWork() -> (Int, Double) {
        queueManager.clearQueue()
        return (customerCount, elapsedTime)
    }
    
    private func greetCustomer() {
        customerCount = Int.random(in: 10...30)
        let queue = queueManager.getQueue()
        
        for index in 1...customerCount {
            let newCustomer = Customer(id: index, task: selectRandomTask())
            
            queue.enqueue(newCustomer)
        }
    }
    
    private func openBank() {
        let startTime = Date()
        startWork()
        let endTime = Date()
        
        elapsedTime = endTime.timeIntervalSince(startTime)
    }

    
    private func startWork() {
        let queue = queueManager.getQueue()
        let group = DispatchGroup()

        while !queue.isEmpty() {
            let customer = queue.dequeue()
            
            guard let customer = customer else {
                return
            }
            
           insert(customer, group)
        }
        group.wait()
    }
    
    private func insert(_ customer: Customer, _ group: DispatchGroup) {
        let task = customer.task
        let semaphore = task.semaphore
        
        DispatchQueue.global().async(group: group) { [weak self] in
            semaphore.wait()
            self?.banker.work(for: customer)
            semaphore.signal()
        }
    }
    
    private func selectRandomTask() -> Taskable.Type {
        let allCases: [Taskable.Type] = [DepositTask.self, LoanTask.self]
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}
