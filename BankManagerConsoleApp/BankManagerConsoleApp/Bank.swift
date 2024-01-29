final class Bank {
    private var customerCount: Int
    private var customerQueue: LinkedListQueue<Customer>
    private let customerCountRange: ClosedRange<Int> = 10...30
    
    init() {
        self.customerCount = 0
        self.customerQueue = LinkedListQueue<Customer>()
    }
}
