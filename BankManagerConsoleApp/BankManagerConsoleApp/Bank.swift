final class Bank {
    private var maxCustomerNumber: Int
    private var customerQueue: LinkedListQueue<Customer>
    private var bankManagerQueue: LinkedListQueue<BankManager>
    private let customerCountRange: ClosedRange<Int> = 10...30
    
    init(bankManagerCount: Int) {
        self.maxCustomerNumber = 0
        self.customerQueue = LinkedListQueue<Customer>()
        self.bankManagerQueue = LinkedListQueue<BankManager>()
        makeBankManagerQueue(bankManagerCount)
    }
}

extension Bank {
    func makeBankManagerQueue(_ bankManagerCount: Int) {
        (1...bankManagerCount).forEach { _ in
            let bankManger = BankManager()
            bankManagerQueue.enqueue(element: bankManger)
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
            customerQueue.enqueue(element: Customer(number: $0))
            maxCustomerNumber += 1
        }
    }
    
    private func openBanck() {
        while let customer: Customer = customerQueue.dequeue(),
              let bankManager: BankManager = bankManagerQueue.dequeue() {
            bankManager.deal(with: customer) { [weak self] manager in
                self?.bankManagerQueue.enqueue(element: manager)
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
