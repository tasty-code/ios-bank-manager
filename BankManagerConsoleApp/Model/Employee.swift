
import Foundation

struct Employee {
    var loanTask: DispatchQueue?
    var depositTask: DispatchQueue?
    
    init(loanTask: DispatchQueue? = nil, depositTask: DispatchQueue? = nil) {
        self.loanTask = loanTask
        self.depositTask = depositTask
    }
    
    func handleLoanTasks(atTable index: Int, with customerLoanQueue: Queue<Customer>, bankManager: BankManager, group: DispatchGroup) {
        bankManager.employees[index].loanTask?.async(group: group) {
            while let customer = customerLoanQueue.dequeue() {
                guard let (customerTicketNumber, customerBankingService) = customer.askEmployeeHandleTasks(), let definedCustomerTicketNumber = customerTicketNumber, let definedCustomerBankingService = customerBankingService else { return }
                print("🌝 \(definedCustomerTicketNumber)번 고객 \(definedCustomerBankingService.name)업무 시작")
                Thread.sleep(forTimeInterval: 1.1)
                print("🌝 \(definedCustomerTicketNumber)번 고객 \(definedCustomerBankingService.name)업무 종료")
            }
        }
    }
    
    func handleDepositTasks(atTable index: Int, with customerDepositQueue: Queue<Customer>, bankManager: BankManager, group: DispatchGroup, semaphore: DispatchSemaphore) {
        
        if index == 1 {
            bankManager.employees[index].depositTask?.async(group: group) {
                semaphore.wait()
                while let customer = customerDepositQueue.dequeue() {
                    
                    guard let (customerTicketNumber, customerBankingService) = customer.askEmployeeHandleTasks(), let definedCustomerTicketNumber = customerTicketNumber, let definedCustomerBankingService = customerBankingService else { return }
                    semaphore.signal()
                    
                    print("🥵 \(definedCustomerTicketNumber)번 고객 \(definedCustomerBankingService.name)업무 시작")
                    Thread.sleep(forTimeInterval: 0.7)
                    print("🥵 \(definedCustomerTicketNumber)번 고객 \(definedCustomerBankingService.name)업무 종료")
                }
            }
        } else if index == 2 {
            bankManager.employees[index].depositTask?.async(group: group) {
                semaphore.wait()
                while let customer = customerDepositQueue.dequeue() {
                    guard let (customerTicketNumber, customerBankingService) = customer.askEmployeeHandleTasks(), let definedCustomerTicketNumber = customerTicketNumber, let definedCustomerBankingService = customerBankingService else { return }
                    semaphore.signal()
                    
                    print("🥶 \(definedCustomerTicketNumber)번 고객 \(definedCustomerBankingService.name)업무 시작")
                    Thread.sleep(forTimeInterval: 0.7)
                    print("🥶 \(definedCustomerTicketNumber)번 고객 \(definedCustomerBankingService.name)업무 종료")
                }
            }
        }
    }
}
