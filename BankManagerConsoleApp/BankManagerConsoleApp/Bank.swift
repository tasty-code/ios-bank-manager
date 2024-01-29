final class Bank {
    private var customerCount: Int
    private var customerQueue: LinkedListQueue<Customer>
    private var bankManagerQueue: LinkedListQueue<BankManager>
    private let customerCountRange: ClosedRange<Int> = 10...30
    
    init(bankManagerCount: Int) {
        self.customerCount = 0
        self.customerQueue = LinkedListQueue<Customer>()
        self.bankManagerQueue = LinkedListQueue<BankManager>()
        (1...bankManagerCount).forEach { _ in
            let bankManger = BankManager()
            bankManagerQueue.enqueue(element: bankManger)
        }
    }
}

extension Bank {
    func process() {
        Message.menu.printMessage()
        Message.input.printMessage()
        
        guard let selectedMenu = selectMenu() else {
            Message.wrongInput.printMessage()
            process()
            return
        }
        
        if selectedMenu == Menu.exit.value {
            return
        }
        
        makeCustomerQueue()
        openBanck()
    }
    
    private func selectMenu() -> Int? {
        guard let input = readLine(),
              let selectedMenu = Int(input),
              (Menu.open.value...Menu.exit.value) ~= selectedMenu else {
            return nil
        }
        return selectedMenu
    }
    
    private func makeCustomerQueue() {
        (1...Int.random(in: customerCountRange)).forEach {
            customerQueue.enqueue(element: Customer(number: $0))
            customerCount += 1
        }
    }
    
    private func openBanck() {
    }
}
