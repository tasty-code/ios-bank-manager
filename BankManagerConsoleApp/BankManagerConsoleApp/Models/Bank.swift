import Foundation

struct Bank {
    
    private let bankEmployeeCount: Int
    private var businessHour: Double = 0.0
    
    private let customerCount: Int = Int.random(in: 10...30)
    private let customerWaitingLoanList: Queue = Queue<Customer>()
    private let customerWaitingDepositList: Queue = Queue<Customer>()
    
    init(bankEmployeeCount: Int) {
        self.bankEmployeeCount = bankEmployeeCount
    }
}

// MARK: - Bank Method
extension Bank {
    
    func enqueueLoanCustomer(customerInfo: Customer) {
        customerWaitingLoanList.enqueue(data: customerInfo)
    }
    
    func enqueueDepositCustomer(customerInfo: Customer) {
        customerWaitingDepositList.enqueue(data: customerInfo)
    }
    
    func dequeueLoanCustomer() {
        customerWaitingLoanList.dequeue()
    }
    
    func dequeueDepositCustomer() {
        customerWaitingDepositList.dequeue()
    }
    
    func fetchCustomerWaitingLoanList() -> Queue<Customer> {
        return customerWaitingLoanList
    }
    
    func fetchCustomerWaitingDepositList() -> Queue<Customer> {
        return customerWaitingDepositList
    }
    
    func fetchCustomerCount() -> Int {
        return customerCount
    }
    
    func customerLoanPeek() -> Customer? {
        return customerWaitingLoanList.peek()
    }
    
    func customerDepositPeek() -> Customer? {
        return customerWaitingDepositList.peek()
    }
    
    func fetchLoanCustomerIsEmpty() -> Bool {
        return customerWaitingLoanList.isEmpty()
    }
    
    func fetchDepositCustomerIsEmpty() -> Bool {
        return customerWaitingDepositList.isEmpty()
    }
    
    func fetchTime() -> Double {
        return businessHour.formatTimeToTwoDecimalPlaces()
    }
    
    mutating func addProcessTime(_ time: Double) {
        businessHour += time
    }
}
