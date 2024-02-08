
import Foundation

struct Employee {
    var loanTask: DispatchQueue?
    var depositTask: DispatchQueue?
    
    init(loanTask: DispatchQueue? = nil, depositTask: DispatchQueue? = nil) {
        self.loanTask = loanTask
        self.depositTask = depositTask
    }
    
    func handleTasks(with customerManager: CustomerManager, bankManager: BankManager, group: DispatchGroup, semaphore: DispatchSemaphore? = nil) {
        var mutableCustomerManager = customerManager
       
        bankManager.employee[0].loanTask?.async(group: group) {
            while mutableCustomerManager.loanTicketMachine.isEmpty == false {
                guard let customer = mutableCustomerManager.dequeueLoanCustomerFromQueue() else { return }
                guard let customerInformation = customer.askEmployeeHandleTasks() else { return }
                print("🌝 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 1.1)
                print("🌝 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 종료")
            }
        }
        
        bankManager.employee[1].depositTask?.async(group: group) {
            while mutableCustomerManager.depositTicketMachine.isEmpty == false {
                semaphore?.wait()
                guard let customer = mutableCustomerManager.dequeueDepositCustomerFromQueue() else { return }
                semaphore?.signal()
                
                guard let customerInformation = customer.askEmployeeHandleTasks() else { return }
                print("🥵 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("🥵 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 종료")
            }
        }
   
        bankManager.employee[2].depositTask?.async(group: group) {
            while mutableCustomerManager.depositTicketMachine.isEmpty == false {
                semaphore?.wait()
                guard let customer = mutableCustomerManager.dequeueDepositCustomerFromQueue() else { return }
                semaphore?.signal()
                
                guard let customerInformation = customer.askEmployeeHandleTasks() else { return }
                print("🥶 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("🥶 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 종료")
            }
        }
    }
}
