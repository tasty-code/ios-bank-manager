import Foundation

final class BankManager {
    private let customerCount: Int
    private let tellers: Tellers
    private let depositCustomerQueue: Queue<Int>
    private let loanCustomerQueue: Queue<Int>
    private var startTime: Date
    
    init(depositTellerCount: Int, loanTellerCount: Int) {
        self.customerCount = Int.random(in: 10...30)
        self.tellers = Tellers(depositTellerCount: 2, loanTellerCount: 1)
        self.depositCustomerQueue = Queue<Int>(type: TypeOfWork.Deposit)
        self.loanCustomerQueue = Queue<Int>(type: TypeOfWork.Loan)
        self.startTime = Date()
    }
    
    private func createCustomerQueue(customerCount: Int) {
        for n in 1...customerCount {
            let randomNumber = Int.random(in: 0...1)
            
            switch randomNumber {
            case TypeOfWork.Deposit.rawValue:
                depositCustomerQueue.enqueue(data: n)
            case TypeOfWork.Loan.rawValue:
                loanCustomerQueue.enqueue(data: n)
            default:
                return
            }
        }
    }
    
    func startTask() {
        startTime = Date()
        createCustomerQueue(customerCount: customerCount)
        
        tellers.doTask(depositCustomerQueue: depositCustomerQueue, loanCustomerQueue: loanCustomerQueue)
    }
    
    func finishTask() {
        let endTime = Date()
        let time = endTime.timeIntervalSince(startTime)
        let totalSecond = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalSecond)초 입니다.")
    }
}
