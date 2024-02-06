
import Foundation

struct Employee {
    func handleTasks(with customerManager: CustomerManager, bankManager: BankManager, group: DispatchGroup, semaphore: DispatchSemaphore? = nil) {
        var mutableCustomerManager = customerManager
       
        bankManager.loan?.async(group: group) {
            while mutableCustomerManager.loanTicketMachine.isEmpty == false {
                guard let customer = mutableCustomerManager.loanTicketMachine.dequeue() else { return }
                print("🌝 \(customer.ticketNumber)번 고객 \(customer.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 1.1)
                print("🌝 \(customer.ticketNumber)번 고객 \(customer.task.name)업무 종료")
            }
        }
        
        bankManager.deposit_task1?.async(group: group) {
            while mutableCustomerManager.depositTicketMachine.isEmpty == false {
                semaphore?.wait()
                guard let customer = mutableCustomerManager.depositTicketMachine.dequeue() else { return }
                semaphore?.signal()
                
                print("🥵 \(customer.ticketNumber)번 고객 \(customer.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("🥵 \(customer.ticketNumber)번 고객 \(customer.task.name)업무 종료")
            }
        }
   
        bankManager.deposit_task2?.async(group: group) {
            while mutableCustomerManager.depositTicketMachine.isEmpty == false {
                semaphore?.wait()
                guard let customer = mutableCustomerManager.depositTicketMachine.dequeue() else { return }
                semaphore?.signal()
                
                print("🥶 \(customer.ticketNumber)번 고객 \(customer.task.name)업무 시작")
                Thread.sleep(forTimeInterval: 0.7)
                print("🥶 \(customer.ticketNumber)번 고객 \(customer.task.name)업무 종료")
            }
        }
    }
}
