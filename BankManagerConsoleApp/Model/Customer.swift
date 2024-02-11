
struct Customer: Equatable {
    private(set) var ticketNumber: Int?
    private(set) var bankingService: BankingService?
    
    func askEmployeeHandleTasks() -> (Int?, BankingService?)? {
        return (ticketNumber, bankingService)
    }
}
