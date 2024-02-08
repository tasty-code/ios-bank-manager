
import Foundation

struct Employee {
    
    func handleTasks(with customerManager: CustomerManager, bankManager: BankManager, group: DispatchGroup, semaphore: DispatchSemaphore? = nil) {
        var mutableCustomerManager = customerManager
       
        bankManager.loanEmployee?.async(group: group) {
            while mutableCustomerManager.loanTicketMachine.isEmpty == false {
                guard let customer = mutableCustomerManager.dequeueLoanCustomerFromQueue() else { return }
                guard let customerInformation = customer.askEmployeeHandleTasks() else { return }
                print("🌝 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 1.1)
                print("🌝 \(customerInformation.ticketNumber)번 고객 \(customerInformation.task.name)업무 종료")
            }
        }
        
        bankManager.depositEmployee1?.async(group: group) {
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
   
        bankManager.depositEmployee2?.async(group: group) {
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
