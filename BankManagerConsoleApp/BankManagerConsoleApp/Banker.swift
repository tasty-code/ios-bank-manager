import Foundation

final class Banker {
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
        while !customerQueue.isEmpty {
            if let dequeue = customerQueue.dequeue() {
                BankMessage.taskStart(with: dequeue).message()
                processTransaction(for: dequeue, with: dequeue.taskTime)
                BankMessage.taskComplete(with: dequeue).message()
            }
        }
        taskclose(customerQueue.count, totalProcessingTime)
        customerQueue.clear()
    }
}

// MARK: - 처리 시간 및 처리 완료 메서드
private extension Banker {
    func taskclose(_ customersCount: Int, _ totalProcessingTime: Double) {
        let time = String(format: "%.2f", totalProcessingTime)
        BankMessage.close(customersCount: customersCount, totalProcessingTime: time).message()
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
