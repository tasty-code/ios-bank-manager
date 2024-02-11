
struct CustomerManager {
    private(set) var loanTicketMachine: Queue<Customer> = Queue<Customer>()
    private(set) var depositTicketMachine: Queue<Customer> = Queue<Customer>()
    var customerNumber = CustomerNumber(loan: 0, deposit: 0)
    
    var totalCustomerNumber: Int {
        return customerNumber.loan + customerNumber.deposit
    }
    
    mutating func arrangeCustomers() {
        createCustomers()
        customerNumber.loan = loanTicketMachine.totalLength()
        customerNumber.deposit = depositTicketMachine.totalLength()
    }
    
    func createCustomers() {
        let number = Int.random(in: 10...30)
        for ticketNumber in 1...number {
            guard let customerChoice = BankingService.allCases.randomElement() else { return }
            customerChoice == BankingService.loan ?
            loanTicketMachine.enqueue(with: Customer(ticketNumber: ticketNumber, bankingService: customerChoice)) :
            depositTicketMachine.enqueue(with: Customer(ticketNumber: ticketNumber, bankingService: customerChoice))
        }
    }
    
    func dequeueLoanCustomerFromQueue() -> Customer? {
        return loanTicketMachine.dequeue()
    }
    
    func dequeueDepositCustomerFromQueue() -> Customer? {
        return depositTicketMachine.dequeue()
    }
    
    func resetCustomer() {
        loanTicketMachine.clean()
        depositTicketMachine.clean()
    }
}
