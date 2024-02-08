
struct Customer: Equatable {
    private(set) var ticketNumber: Int
    private(set) var bankingService: BankingService
    
    func askEmployeeHandleTasks() -> (ticketNumber: Int, task: BankingService)? {
        return (ticketNumber, bankingService)
    }
}
