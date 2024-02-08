
struct Customer: Equatable {
    private(set) var ticketNumber: Int
    private(set) var task: BankingService
    
    func askEmployeeHandleTasks() -> (ticketNumber: Int, task: BankingService)? {
        return (ticketNumber, task)
    }
}
