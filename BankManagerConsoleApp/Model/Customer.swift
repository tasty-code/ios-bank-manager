
struct Customer: Equatable {
    private(set) var ticketNumber: Int
    private(set) var task: Task
    
    func askEmployeeHandleTasks() -> (ticketNumber: Int, task: Task)? {
        return (ticketNumber, task)
    }
}
