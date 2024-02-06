
import Foundation

struct ConsoleManager {
    private var isOpen: Bool = false
    private var customerManager: CustomerManager = CustomerManager()
    private var bankManager: BankManager = BankManager()
    
    mutating func operate() {
        isOpen = false
        printMenuOfBank()
        
        do {
            let input = try selectedByUser()
            isOpen = triggerBankDoor(by: input)
        } catch {
            print(error.localizedDescription)
            operate()
        }
        
        while isOpen {
            executeBankingOperation()
        }
    }
    
    private func triggerBankDoor(by input: String) -> Bool {
        if input == "1" {
            return true
        } else {
            print("종료되었습니다.")
            return false
        }
    }
    
    private mutating func executeBankingOperation() {
        bankManager.assignEmployeeTasks()
        customerManager.createCustomers()
        customerManager.registerCustomers()
        
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 1)
        let mutableCustomerManager = self.customerManager
        let employees = Employee()
        
        let bankingServiceStart = Date.timeIntervalSinceReferenceDate
        employees.handleTasks(with: mutableCustomerManager, bankManager: bankManager, group: group, semaphore: semaphore)
        group.wait()
        let bankingServiceEnd = Date.timeIntervalSinceReferenceDate
        
        bankManager.reportDeadlineSummary(with: customerManager, startTime: bankingServiceStart, endTime: bankingServiceEnd)
        customerManager.resetCustomer()
        operate()
    }
    
    private func selectedByUser() throws -> String {
        guard let input = readLine(), input == "1" || input == "2" else {
            throw InputError.wrongInput
        }
        return input
    }
    
    private func printMenuOfBank() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
}
