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
    
    func greetCustomer() {
        customerCount = Int.random(in: 10...30)
        let queue = queueManager.getQueue()
        
        for index in 1...customerCount {
            let newCustomer = Customer(id: index, task: Task.random())
            
            queue.enqueue(newCustomer)
        }
    }
    
    func openBank() {
        let startTime = Date()
        startWork()
        let endTime = Date()
        
        elapsedTime = endTime.timeIntervalSince(startTime)
    }
    
    func prepareWork() {
        greetCustomer()
        openBank()
    }
    
    func prepareCloseWork() -> (Int, Double) {
        queueManager.clearQueue()
        return (customerCount, elapsedTime)
    }
    
    private func startWork() {
        let queue = queueManager.getQueue()
        let group = DispatchGroup()
        
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        
        while !queue.isEmpty() {
            let customer = queue.dequeue()
            
            guard let customer = customer else {
                return
            }
            
            switch customer.task {
            case .deposit:
                insert(customer, toWaitingQueueBy: depositSemaphore, as: Banker.depositTime, group)
            case .loan:
                insert(customer, toWaitingQueueBy: loanSemaphore, as: Banker.loanTime, group)
            }
        }
        group.wait()
    }
    
    private func insert(_ customer: Customer, toWaitingQueueBy dispatchSemaphore: DispatchSemaphore, as time: Double, _ group: DispatchGroup) {
        
        DispatchQueue.global().async(group: group) { [self] in
            dispatchSemaphore.wait()
            banker.work(for: customer, as: time)
            dispatchSemaphore.signal()
        }
    }
    
}
