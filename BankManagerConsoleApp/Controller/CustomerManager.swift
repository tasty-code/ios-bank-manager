
struct CustomerManager {
    private(set) var customers: [Customer] = []
    private(set) var ticketMachine = Queue<Customer>()
    
    mutating func createCustomer() {
        let number = Int.random(in: 10...30)
        for ticketNumber in 1...number {
            customers.append(Customer(ticketNumber: ticketNumber))
        }
    }
    
    mutating func registerCustomer(with customers: [Customer]) {
        for customer in customers {
            ticketMachine.enqueue(with: customer)
        }
    }
    
    mutating func resetCustomer() {
        customers = []
        ticketMachine.clean()
    }
}
