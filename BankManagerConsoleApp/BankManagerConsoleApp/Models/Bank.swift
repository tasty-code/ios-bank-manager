final class Bank {
    private let customerCountRange: ClosedRange<Int> = 10...30
    private var maxCustomerNumber: Int
    private var depositCustomerQueue: LinkedListQueue<Customer>
    private var loanCustomerQueue: LinkedListQueue<Customer>
    private var depositManagerQueue: LinkedListQueue<BankManager>
    private var loanManagerQueue: LinkedListQueue<BankManager>
    private var isDepositManagerWorking: Bool
    private var isLoanManagerWorking: Bool
    private var isbankWorking: Bool {
        return isDepositManagerWorking || isLoanManagerWorking
    }
    
    init() {
        self.maxCustomerNumber = 0
        self.depositCustomerQueue = LinkedListQueue<Customer>()
        self.loanCustomerQueue = LinkedListQueue<Customer>()
        self.depositManagerQueue = LinkedListQueue<BankManager>()
        self.loanManagerQueue = LinkedListQueue<BankManager>()
        self.isDepositManagerWorking = true
        self.isLoanManagerWorking = true
    }
}

extension Bank {
    private func makeBankManagerQueue(depositManagerCount: Int, loanManagerCount: Int) {
        (1...depositManagerCount).forEach { _ in
            depositManagerQueue.enqueue(BankManager())
        }
        (1...loanManagerCount).forEach { _ in
            loanManagerQueue.enqueue(BankManager())
        }
    }
    
    func process() {
        Message.menu.printMessage()
        Message.input.printMessage()
        
        guard let selectedMenu = validate()else {
            Message.wrongInput.printMessage()
            process()
            return
        }
        
        if selectedMenu == .wrongInput {
            Message.wrongInput.printMessage()
            process()
            return
        }
        
        if selectedMenu == .exit {
            return
        }
        
        makeCustomerQueue()
        openBanck()
    }
    
    private func validate() -> Menu? {
        guard let input = readLine(),
              let userInput = Int(input) else {
            return nil
        }
        return Menu(input: userInput)
    }
    
    private func makeCustomerQueue() {
        (1...Int.random(in: customerCountRange)).forEach {
            let task: Task = Int.random(in: 1...2) == 1 ? .deposit : .loan
            let customerQueue = task == .deposit ? depositCustomerQueue : loanCustomerQueue
            customerQueue.enqueue(Customer(number: $0, task: task))
            maxCustomerNumber += 1
        }
        isDepositManagerWorking = depositCustomerQueue.isEmpty ? false : true
        isLoanManagerWorking = loanCustomerQueue.isEmpty ? false : true
    }
    
    private func openBanck() {
        while let customer: Customer = customerQueue.dequeue(),
              let bankManager: BankManager = bankManagerQueue.dequeue() {
            bankManager.deal(with: customer) { [weak self] manager in
                self?.bankManagerQueue.enqueue(manager)
            }
        }
        closeBank()
    }
    
    private func closeBank() {
        Message.close(customerCount: maxCustomerNumber, time: Double(maxCustomerNumber) * Customer.taskTime).printMessage()
        maxCustomerNumber = 0
        process()
    }
}
