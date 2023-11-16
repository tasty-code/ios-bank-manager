import Foundation

final class BankManager {
    private var customerCount: Int = 0
    private let depositCustomerQueue = Queue<Int>()
    private let loanCustomerQueue = Queue<Int>()
    var depositTellers: Tellers
    var loanTellers: Tellers
    weak var delegate: BankUIDelegate?
    
    
    init(depositTellerCount: Int, loanTellerCount: Int) {
        self.depositTellers = Tellers(tellerCount: depositTellerCount, tellerType: .Deposit)
        self.loanTellers = Tellers(tellerCount: loanTellerCount, tellerType: .Loan)
    }
    
    func createCustomerQueue() {
        for n in 1...10 {
            guard let work = TypeOfWork(rawValue: Int.random(in: 0...1)) else {
                return
            }
            
            switch work {
                
            case .Deposit:
                depositCustomerQueue.enqueue(data: n + customerCount)
                delegate?.addTaskLabel(type: .Deposit, number: n + customerCount, textColor: .black)
            case .Loan:
                loanCustomerQueue.enqueue(data: n + customerCount)
                delegate?.addTaskLabel(type: .Loan, number: n + customerCount, textColor: .orange)
            }
        }
        customerCount += 10
    }
    
    func startTask() {
        let depositWork = (depositTellers, depositCustomerQueue)
        let loanWork = (loanTellers, loanCustomerQueue)
        
        [depositWork, loanWork].forEach { (tellers, queue) in
            DispatchQueue.global(qos: .utility ).async {
                tellers.doTask(queue: queue)
            }
        }
    }
    
    func reset() {
        customerCount = 0
        depositCustomerQueue.clear()
        loanCustomerQueue.clear()
    }
}
