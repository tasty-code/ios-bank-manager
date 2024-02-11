
import Foundation

struct Employee {
    var loanTask: DispatchQueue?
    var depositTask: DispatchQueue?
    
    init(loanTask: DispatchQueue? = nil, depositTask: DispatchQueue? = nil) {
        self.loanTask = loanTask
        self.depositTask = depositTask
    }
    
    func handleTasksLoan(with customerLoanQueue: Queue<Customer>, bankManager: BankManager, group: DispatchGroup, semaphore: DispatchSemaphore? = nil) {
        bankManager.employees[0].loanTask?.async(group: group) {
            while customerLoanQueue.isEmpty == false {
                guard let customer = customerLoanQueue.dequeue() else { return }
                guard let customerInformation = customer.askEmployeeHandleTasks() else { return }
                print("🌝 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 1.1)
                print("🌝 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 종료")
            }
        }
    }
    
    func handleTasksDeposit(with customerDepositQueue: Queue<Customer>, bankManager: BankManager, group: DispatchGroup, semaphore: DispatchSemaphore? = nil) {
        bankManager.employees[1].depositTask?.async(group: group) {
            while customerDepositQueue.isEmpty == false {
                semaphore?.wait()
                guard let customer = customerDepositQueue.dequeue() else { return }
                semaphore?.signal()
                
                guard let customerInformation = customer.askEmployeeHandleTasks() else { return }
                print("🥵 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("🥵 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 종료")
            }
        }
   
        bankManager.employees[2].depositTask?.async(group: group) {
            while customerDepositQueue.isEmpty == false {
                semaphore?.wait()
                guard let customer = customerDepositQueue.dequeue() else { return }
                semaphore?.signal()
                
                guard let customerInformation = customer.askEmployeeHandleTasks() else { return }
                print("🥶 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("🥶 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 종료")
            }
        }
    }
}
