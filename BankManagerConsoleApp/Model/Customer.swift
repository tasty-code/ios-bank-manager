
struct Customer: Equatable {
    private var ticketNumber: Int?
    private var bankingService: BankingService?
    
    init(ticketNumber: Int? = nil, bankingService: BankingService? = nil) {
        self.ticketNumber = ticketNumber
        self.bankingService = bankingService
    }
    
    func askEmployeeHandleTasks() -> (Int?, BankingService?)? {
        return (ticketNumber, bankingService)
    }
}
