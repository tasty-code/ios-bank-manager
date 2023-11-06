import Foundation

final class BankManager {
    private let customerCount: Int
    private let depositTellers: Tellers
    private let loanTellers: Tellers
    private let depositCustomerQueue = Queue<Int>()
    private let loanCustomerQueue = Queue<Int>()
    private var startTime: Date
    
    init(depositTellerCount: Int, loanTellerCount: Int) {
        self.customerCount = Int.random(in: 10...30)
        self.depositTellers = Tellers(tellerCount: depositTellerCount, tellerType: .Deposit)
        self.loanTellers = Tellers(tellerCount: loanTellerCount, tellerType: .Loan)
        self.startTime = Date()   //옵셔널로 할까???
    }
    
    private func createCustomerQueue(customerCount: Int) {
        for n in 1...customerCount {
            guard let randomWork = TypeOfWork(rawValue: Int.random(in: 0...1)) else {
                return
            }

            switch randomWork {
            case .Deposit:
                depositCustomerQueue.enqueue(data: n)
            case .Loan:
                loanCustomerQueue.enqueue(data: n)
            }
        }
    }
    
    func startTask() {
        startTime = Date()
        createCustomerQueue(customerCount: customerCount)
        groupingTask()
    }
    
    func finishTask() {
        let endTime = Date()
        let time = endTime.timeIntervalSince(startTime)
        let totalSecond = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalSecond)초 입니다.")
    }
    
    func groupingTask() {
        let groupOfAll = DispatchGroup()
        
        groupOfAll.enter()
        DispatchQueue.global().async { [self] in
            depositTellers.doTask(queue: depositCustomerQueue)
            groupOfAll.leave()
        }
        groupOfAll.enter()
        DispatchQueue.global().async { [self] in
            loanTellers.doTask(queue: loanCustomerQueue)
            groupOfAll.leave()
        }
        groupOfAll.wait()
        
    }
    
    
    
}




//func do11Task(depositCustomerQueue: Queue<Int>, loanCustomerQueue: Queue<Int>) {
//    groupingTask(queue: depositCustomerQueue)
//    groupingTask(queue: loanCustomerQueue)
//    groupOfAll.wait()
//}
