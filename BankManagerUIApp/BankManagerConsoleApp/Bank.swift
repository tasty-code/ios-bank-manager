import Foundation

final class Bank {
    private weak var bankerDelegate: BankerDelegate?
    private weak var bankDelegate: BankDelegate?
    private var queueManager: QueueManager
    private var banker: Banker
    private var totalCustomerCount: Int
    private var elapsedTime: Double
    private var isReset: Bool = false
    
    init(queueManager: QueueManager = QueueManager(), banker: Banker = Banker(), customerCount: Int = 0, elapsedTime: Double = 0.0, bankerDelegate: BankerDelegate, bankDelegate: BankDelegate) {
        self.queueManager = queueManager
        self.banker = banker
        self.totalCustomerCount = customerCount
        self.elapsedTime = elapsedTime
        self.bankerDelegate = bankerDelegate
        self.bankDelegate = bankDelegate
    }
    
    func greetCustomer() {
        let nowCustomerCount = totalCustomerCount + 1
        
        totalCustomerCount = (totalCustomerCount != 0) ? (totalCustomerCount + 10) : Int.random(in: 10...30)
        
        let queue = queueManager.getQueue()
        
        for index in nowCustomerCount...totalCustomerCount {
            let newCustomer = Customer(orderNumber: index, task: selectRandomTask())
             
            queue.enqueue(newCustomer)
        }
    }

    func startWork() {
        isReset = false
        
        DispatchQueue.global().async { [self] in
            let queue = queueManager.getQueue()
            let group = DispatchGroup()
            
            while !queue.isEmpty() {
                let customer = queue.dequeue()
                guard let customer = customer else {
                    return
                }
                bankDelegate?.addWaitingStackView(self, customer)
                
                insert(customer, group)
            }
            group.wait()
        }
    }
    
    func prepareCloseWork() {
        totalCustomerCount = 0
        queueManager.clearQueue()
        isReset = true
    }
    
    private func insert(_ customer: Customer, _ group: DispatchGroup) {
        let task = customer.task
        let semaphore = task.semaphore
        
        DispatchQueue.global(qos: .background).async(group: group) { [weak self] in
            guard let self = self else {
                return
            }
            
            semaphore.wait()
            self.banker.work(self.bankerDelegate, for: customer, self.isReset)
            semaphore.signal()
        }
    }
    
    private func selectRandomTask() -> Taskable.Type {
        let allCases: [Taskable.Type] = [DepositTask.self, LoanTask.self]
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}
