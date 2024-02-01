import Foundation

final class Bank: PrintableMessage {
    private var customerQueue = Queue<Customer>()
    private let banker: Banker
    
    init( banker: Banker) {
        self.banker = banker
    }
    
    func openBank() {
        generateCustomerQueue()
        banker.taskProcess(queue: customerQueue)
        closeBank()
    }
    
    private func generateCustomerQueue() {
        let waitingNumber = Int.random(in: 10...30)
        for num in 1...waitingNumber {
            customerQueue.enqueue(value: Customer(waitingNumber: num))
        }
    }
    
    private func closeBank() {
        printClosingMessage(customersCount: banker.customersCount, totalProcessingTime: banker.totalProcessingTime)
        banker.resetProcessingTimeAndCount()
    }
}
