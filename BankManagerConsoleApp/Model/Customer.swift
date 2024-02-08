
struct Customer: Equatable {
    private(set) var ticketNumber: Int
    private(set) var task: BankingServices
    
    func askEmployeeHandleTasks() -> (ticketNumber: Int, task: BankingServices)? {
        return (ticketNumber, task)
    }
}
