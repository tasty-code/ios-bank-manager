import Foundation

final class Bank: PrintableMessage {
    private var bankers: [Banker]
    private var customersQueue: [BankingService: Queue<Customer>] = [:]
    private let depositSemaphore: DispatchSemaphore
    let group = DispatchGroup()
    
    init(bankers: [Banker], depositSemaphore: DispatchSemaphore) {
        self.bankers = bankers
        self.depositSemaphore = depositSemaphore
        for service in BankingService.allCases {
            customersQueue[service] = Queue<Customer>()
        }
    }
    
    func openBank() {
        generateCustomerQueue()

        for banker in bankers {
            group.enter()
            DispatchQueue.global().async {
                switch banker.service {
                case .deposit:
                    self.depositSemaphore.wait()
                    banker.taskProcess(queue: self.customersQueue[.deposit]!)
                    self.depositSemaphore.signal()
                    
                case .loan:
                    banker.taskProcess(queue: self.customersQueue[.loan]!)
                }
                self.group.leave()
            }
        }
        group.wait()
        closeBank()
    }
    
    private func generateCustomerQueue() {
        let waitingNumber = Int.random(in: 12...13)
        for num in 1...waitingNumber {
            /// 대출 1명....ㅇ
            let taskType: BankingService = num % 3 == 0 ? .loan : .deposit
            if let queue = customersQueue[taskType] {
                queue.enqueue(value: Customer(waitingNumber: num, taskType: taskType))
            }
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
