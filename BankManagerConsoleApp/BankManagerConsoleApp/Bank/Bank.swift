import Foundation

final class Bank: PrintableMessage {
    private var customerQueue = Queue<Customer>()
    private let bankers: [Banker]
    
    let group = DispatchGroup()
    private let depositSemaphore: DispatchSemaphore
    private let loanSemaphore: DispatchSemaphore
    
    init(bankers: [Banker], depositSemaphore: DispatchSemaphore, loanSemaphore: DispatchSemaphore) {
        self.bankers = bankers
        self.depositSemaphore = depositSemaphore
        self.loanSemaphore = loanSemaphore
    }
    
    func openBank() {
        generateCustomerQueue()
        
        for banker in bankers {
            group.enter()
            DispatchQueue.global().async {
                banker.taskProcess(queue: self.customerQueue, depositSemaphore: self.depositSemaphore, loanSemaphore: self.loanSemaphore)
                self.group.leave()
            }
        }
        group.wait()
        closeBank()
    }
    
    private func generateCustomerQueue() {
        let waitingNumber = Int.random(in: 10...30)
        for num in 1...waitingNumber {
            let taskType: TaskType = num % 3 == 0 ? .loan : .deposit
            customerQueue.enqueue(value: Customer(waitingNumber: num, taskType: taskType))
        }
    }
    
    private func closeBank() {
        let totalCustomersCount = bankers.reduce(0) { $0 + $1.customersCount }
        let totalProcessingTime = bankers.reduce(0) { $0 + $1.totalProcessingTime }
        printClosingMessage(customersCount: totalCustomersCount, totalProcessingTime: totalProcessingTime)
        resetBankers()
    }
    
    private func resetBankers() {
        for banker in bankers {
            banker.resetProcessingTimeAndCount()
        }
    }
}
