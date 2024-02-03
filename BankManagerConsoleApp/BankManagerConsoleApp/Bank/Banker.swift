import Foundation

final class Banker: PrintableMessage {
    private(set) var totalProcessingTime: TimeInterval = 0
    private(set) var customersCount = 0
    
    func taskProcess(queue: Queue<Customer>, depositSemaphore: DispatchSemaphore, loanSemaphore: DispatchSemaphore) {
        while let dequeue = queue.dequeue() {
            switch dequeue.taskType {
            case .deposit:
                depositSemaphore.wait()
                printStartTaskMessage(customer: dequeue)
                processTransaction(for: dequeue, with: dequeue.taskTime)
                printCompleteTaskMessage(customer: dequeue)
                customersCount += 1
                depositSemaphore.signal()
            case .loan:
                loanSemaphore.wait()
                printStartTaskMessage(customer: dequeue)
                processTransaction(for: dequeue, with: dequeue.taskTime)
                printCompleteTaskMessage(customer: dequeue)
                customersCount += 1
                loanSemaphore.signal()
            }
        }
    }
    
    private func processTransaction(for customer: Customer, with processingTime: TimeInterval) {
        Thread.sleep(forTimeInterval: processingTime)
        totalProcessingTime += processingTime
    }
    
    func resetProcessingTimeAndCount() {
        totalProcessingTime = 0
        customersCount = 0
    }
}
