
struct Customer: Equatable {
    let ticketNumber: Int
    let task: Task
    
    func IHaveThisTask() {
        print("안녕, 저는 \(ticketNumber)번 고객입니다. 제가 처리할 업무는 \(task)입니다.")
    }
}
