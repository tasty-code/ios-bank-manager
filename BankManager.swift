import Foundation

final class BankManager {
    private let customerCount: Int
    var depositTellers: Tellers
    var loanTellers: Tellers
    let depositCustomerQueue = Queue<Int>()
    let loanCustomerQueue = Queue<Int>()
    var total = 0
    var startTime: Date?
    weak var del: Delegate?
//    var state = "stop"
    
    init(depositTellerCount: Int, loanTellerCount: Int) {
        self.customerCount = Int.random(in: 10...30)
        self.depositTellers = Tellers(tellerCount: depositTellerCount, tellerType: .Deposit)
        self.loanTellers = Tellers(tellerCount: loanTellerCount, tellerType: .Loan)
    }
    
   
    func openBank() {
        startTime = Date()
        createCustomerQueue(customerCount: customerCount)
        startTask()
    }
    
    func finishTask() {
        let endTime = Date()
        guard let startTime = startTime else { return }
        let time = endTime.timeIntervalSince(startTime)
        let totalSecond = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalSecond)초 입니다.")
    }
    
    func createCustomerQueue(customerCount: Int) {
            for n in 1...customerCount {
                guard let work = TypeOfWork(rawValue: Int.random(in: 0...1)) else {
                    return
                }
                
//                        DispatchQueue.main.async { [self] in
                switch work {
                case .Deposit:
                    depositCustomerQueue.enqueue(data: n + total)
                    del?.setupDepositLabel(number: n + total)
                case .Loan:
                    loanCustomerQueue.enqueue(data: n + total)
                    del?.setupLoanLabel(number: n + total)
                }
            }
//        }
        
    }
    
     func startTask() {
         

        let depositWork = (depositTellers, depositCustomerQueue)
        let loanWork = (loanTellers, loanCustomerQueue)
        
        let group = DispatchGroup()
        [depositWork, loanWork].forEach { (tellers, queue) in
            group.enter()
            DispatchQueue.global().async {
                tellers.doTask(queue: queue)
                group.leave()
            }
        }
         
        group.wait()

    }

     func uiStartTask() {
         

        let depositWork = (depositTellers, depositCustomerQueue)
        let loanWork = (loanTellers, loanCustomerQueue)
        
        [depositWork, loanWork].forEach { (tellers, queue) in
            DispatchQueue.global().async {
                tellers.doTask(queue: queue)
            }
        }
         
         

    }
    
}
