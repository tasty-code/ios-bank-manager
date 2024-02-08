import Foundation

final class Bank {
    private let customerCountRange: ClosedRange<Int> = 10...15
    private var totalCustomer: Int
    private let customerQueue: LinkedListQueue<Customer>
    private var depositSemaphore: DispatchSemaphore
    private var loanSemaphore: DispatchSemaphore
    
    init() {
        self.totalCustomer = 0
        self.customerQueue = LinkedListQueue<Customer>()
        self.depositSemaphore = DispatchSemaphore(value: 2)
        self.loanSemaphore = DispatchSemaphore(value: 1)
    }
}

extension Bank {
    func process() {
        Message.menu.printMessage()
        Message.input.printMessage()
        guard let userInput = readLine() else { return }
        switch Menu(input: userInput) {
        case .wrongInput:
            Message.wrongInput.printMessage()
            process()
        case .open:
            makeCustomerQueue()
            openBank()
        case .exit:
            break
        }
    }
    
    private func makeCustomerQueue() {
        let totalCustomer = Int.random(in: customerCountRange)
        self.totalCustomer = totalCustomer
        for number in 1...totalCustomer {
            let task: Task = Bool.random() ? .deposit : .loan
            let customer = Customer(number: number, task: task)
            customerQueue.enqueue(customer)
        }
    }
    
    private func openBank() {
        let openTime: Date = Date()
        let dispatchGroup = DispatchGroup()
        processQueue(customerQueue, dispatchGroup: dispatchGroup, queueType: "deposit")
        dispatchGroup.wait()
        closeBank(openTime)
    }
    
    private func processQueue(_ queue: LinkedListQueue<Customer>, dispatchGroup: DispatchGroup,queueType: String) {
        while !queue.isEmpty  {
            guard let customer = queue.dequeue() else { return }
            dispatchGroup.enter()
            let semaphore = customer.task == .deposit ? depositSemaphore : loanSemaphore
            semaphore.wait()
            DispatchQueue.global().async {
                self.processCustomer(customer) {
                    semaphore.signal()
                    dispatchGroup.leave()
                }
            }
        }
    }
    
    private func processCustomer(_ customer: Customer, completion: @escaping () -> Void) {
        let manager = BankManager()
        manager.deal(with: customer, isLastCustomer: totalCustomer == 0) { (manager, task, isLastCustomer) in
            completion()
        }
    }
    
    private func closeBank(_ openTime: Date) {
        Message.close(customerCount: totalCustomer, time: Date().timeIntervalSince(openTime)).printMessage()
        totalCustomer = 0
        process()
    }
}

