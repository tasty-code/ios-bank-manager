import Foundation

final class Bank {
    private weak var delegate: BankerDelegate?
    private var queueManager: QueueManager
    private var banker: Banker
    private var customerCount: Int
    private var elapsedTime: Double
    private var isReset: Bool = false
    
    init(queueManager: QueueManager = QueueManager(), banker: Banker = Banker(), customerCount: Int = 0, elapsedTime: Double = 0.0, delegate: BankerDelegate) {
        self.queueManager = queueManager
        self.banker = banker
        self.customerCount = customerCount
        self.elapsedTime = elapsedTime
        self.delegate = delegate
    }
        
    func prepareCloseWork() {
        customerCount = 0
        queueManager.clearQueue()
        isReset = true
    }
    
    func greetCustomer() -> Queue<Customer> {
        let range = customerCount + 1
        
        if customerCount != 0 {
            customerCount += 10
        } else {
            customerCount = Int.random(in: 10...30)
        }
        
        let queue = queueManager.getQueue()
        
        for index in range...customerCount {
            let newCustomer = Customer(orderNumber: index, task: selectRandomTask())
             
            queue.enqueue(newCustomer)
        }
    
        return queue
    }

    func startWork() {
        isReset = false
        DispatchQueue.global(qos: .userInteractive).async { [self] in
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
    }
    
    private func insert(_ customer: Customer, _ group: DispatchGroup) {
        let task = customer.task
        let semaphore = task.semaphore
        
        DispatchQueue.global(qos: .background).async(group: group) { [weak self] in
            guard let self = self else { 
                return
            }
            
            semaphore.wait()
            self.banker.work(for: customer, self.delegate, self.isReset)
            semaphore.signal()
        }
    }
    
    private func selectRandomTask() -> Taskable.Type {
        let allCases: [Taskable.Type] = [DepositTask.self, LoanTask.self]
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}
