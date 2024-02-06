
struct CustomerManager {
    private(set) var customers: [Customer] = []
    var loanTicketMachine = Queue<Customer>()
    var depositTicketMachine = Queue<Customer>()

    mutating func createCustomers() {
        let number = Int.random(in: 5...20)
        for ticketNumber in 1...number {
            customers.append(Customer(ticketNumber: ticketNumber, task: Task.allCases.randomElement() ?? .대출))
        }
    }
    
    mutating func registerCustomers() {
        for customer in customers {
            if customer.task == Task.대출 {
                loanTicketMachine.enqueue(with: customer)
            } else {
                depositTicketMachine.enqueue(with: customer)
            }
        }
    }
    
    mutating func checkTotalCustomersNumber() -> Int {
        return customers.count
    }
    
    mutating func resetCustomer() {
        customers = []
        loanTicketMachine.clean()
        depositTicketMachine.clean()
    }
}
