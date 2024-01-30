import Foundation

final class Banker {
    var customerQueue = Queue<Customer>()
    private(set) var totalProcessingTime: TimeInterval = 0
    
    func sum() {
        taskStart()
        taskComplete()
    }
    
    func taskStart() {
        let waitingNumber = Int.random(in: 5...6)
        for num in 1...waitingNumber {
            customerQueue.enqueue(value: Customer(waitingNumber: num))
        }
    }
    
    func taskComplete() {
        while !customerQueue.isEmpty {
            if let dequeue = customerQueue.dequeue() {
                BankMessage.taskStart(with: dequeue).message()
                processTransaction(for: dequeue, with: dequeue.taskTime)
                BankMessage.taskComplete(with: dequeue).message()
            }
        }
        taskclose(customerQueue.count, totalProcessingTime)
    }
    
    func taskclose(_ customersCount: Int, _ totalProcessingTime: Double) {
        customerQueue.clear()
        let time = String(format: "%.2f", totalProcessingTime)
        BankMessage.close(customersCount: customersCount, totalProcessingTime: time).message()
        self.totalProcessingTime = 0
    }
    
    func processTransaction(for customer: Customer, with processingTime: TimeInterval) {
        Thread.sleep(forTimeInterval: processingTime)
        totalProcessingTime += processingTime
    }
    
}
