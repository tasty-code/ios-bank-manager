import Foundation

final class Banker: PrintableMessage {
    private var customerQueue = Queue<Customer>()
    private(set) var totalProcessingTime: TimeInterval = 0
    
    func taskStart() {
        generateCustomerQueue()
        taskProcess()
    }
    
    private func generateCustomerQueue() {
        let waitingNumber = Int.random(in: 10...30)
        for num in 1...waitingNumber {
            customerQueue.enqueue(value: Customer(waitingNumber: num))
        }
    }
    
    private func taskProcess() {
        while let dequeue = customerQueue.dequeue() {
            printStartTaskMessage(customer: dequeue)
            processTransaction(for: dequeue, with: dequeue.taskTime)
            printCompleteTaskMessage(customer: dequeue)
        }
        taskClose(customerQueue.count, totalProcessingTime)
        customerQueue.clear()
    }
    
    
}

// MARK: - 처리 시간 및 처리 완료 메서드
private extension Banker {
    func taskClose(_ customersCount: Int, _ totalProcessingTime: TimeInterval) {
        printClosingMessage(customersCount: customersCount, totalProcessingTime: totalProcessingTime)
        resetProcessingTime()
    }
    
    func processTransaction(for customer: Customer, with processingTime: TimeInterval) {
        Thread.sleep(forTimeInterval: processingTime)
        totalProcessingTime += processingTime
    }
    
    func resetProcessingTime() {
        totalProcessingTime = 0
    }
}
