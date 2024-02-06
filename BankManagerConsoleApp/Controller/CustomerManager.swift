
struct CustomerManager {
    private(set) var customers: [Customer] = []
    private(set) var loanTicketMachine = Queue<Customer>()
    private(set) var depositTicketMachine = Queue<Customer>()
    
    mutating func createCustomers() {
        let number = Int.random(in: 10...30)
        for ticketNumber in 1...number {
            customers.append(Customer(ticketNumber: ticketNumber, task: Task.allCases.randomElement() ?? .loan))
        }
    }
    
    mutating func dequeueLoanCustomerFromQueue() -> Customer? {
        return loanTicketMachine.dequeue()
    }
    
    mutating func dequeueDepositCustomerFromQueue() -> Customer? {
        return depositTicketMachine.dequeue()
    }
    
    mutating func registerCustomers() {
        for customer in customers {
            if customer.task == Task.loan {
                loanTicketMachine.enqueue(with: customer)
            } else {
                depositTicketMachine.enqueue(with: customer)
            }
        }
    }
    
    mutating func resetCustomer() {
        customers = []
        loanTicketMachine.clean()
        depositTicketMachine.clean()
    }
}
