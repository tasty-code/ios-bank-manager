import Foundation

struct Bank {
    
    private let bankEmployeeCount: Int
    private let customerWaitingList: Queue = Queue<Int>()
    private let customerCount: Int = Int.random(in: 10...30)
    private var time: Double = 0.0

    init(bankEmployeeCount: Int) {
        self.bankEmployeeCount = bankEmployeeCount
    }
}

// MARK: - Bank Method
extension Bank {
    
    func fetchCustomerWaitingList() -> Queue<Int> {
        return customerWaitingList
    }
    
    func enqueueCustomer(inputData: Int) {
        customerWaitingList.enqueue(data: inputData)
    }
    
    func dequeueCustomer() {
        customerWaitingList.dequeue()
    }
    
    func fetchCustomerCount() -> Int {
        return customerCount
    }
    
    func fetchTime() -> Double {
        return time
    }
    
    mutating func formTime(add: Double) {
        time += add
    }
}
