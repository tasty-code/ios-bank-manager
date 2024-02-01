import Foundation

final class Banker: PrintableMessage {
    private var customerQueue = Queue<Customer>()
    private(set) var totalProcessingTime: TimeInterval = 0
    private(set) var customersCount = 0
    
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
            customersCount += 1
        }
        taskClose(customersCount, totalProcessingTime)
        customerQueue.clear()
    }
    
    
}

// MARK: - 처리 시간 및 처리 완료 메서드
private extension Banker {
    func taskClose(_ customersCount: Int, _ totalProcessingTime: TimeInterval) {
        printClosingMessage(customersCount: customersCount, totalProcessingTime: totalProcessingTime)
        resetProcessingTimeAndCount()
    }
    
    func processTransaction(for customer: Customer, with processingTime: TimeInterval) {
        Thread.sleep(forTimeInterval: processingTime)
        totalProcessingTime += processingTime
    }
    
    func resetProcessingTimeAndCount() {
        totalProcessingTime = 0
        customersCount = 0
    }
}
