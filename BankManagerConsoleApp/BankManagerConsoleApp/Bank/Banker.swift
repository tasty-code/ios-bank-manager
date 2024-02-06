import Foundation

final class Banker: PrintableMessage {
    private(set) var customersCount = 0
    let service: BankingService
    
    init(service: BankingService) {
        self.service = service
    }
    
    func taskProcess(queue: Queue<Customer>)  {
        while let dequeue = queue.dequeue() {
            printStartTaskMessage(customer: dequeue)
            processTransaction(for: dequeue, with: dequeue.taskTime)
            printCompleteTaskMessage(customer: dequeue)
            customersCount += 1
        }
    }

    private func processTransaction(for customer: Customer, with processingTime: TimeInterval) {
        Thread.sleep(forTimeInterval: processingTime)
    }
    
    func resetProcessingCount() {
        customersCount = 0
    }
}
