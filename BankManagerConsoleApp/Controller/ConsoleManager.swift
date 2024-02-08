
import Foundation

struct ConsoleManager {
    private var isOpen: Bool = false
    private var customerManager: CustomerManager = CustomerManager()
    private var bankManager: BankManager = BankManager(employees:[
        Employee(loanTask: DispatchQueue(label: "대출1", attributes: .concurrent)),
        Employee(depositTask: DispatchQueue(label: "예금1", attributes: .concurrent)),
        Employee(depositTask: DispatchQueue(label: "예금2", attributes: .concurrent))
    ])

    mutating func operate() {
        isOpen = false
        printMenuOfBank()
        
        do {
            let input = try selectedByUser()
            isOpen = shouldOpenBank(by: input)
        } catch {
            print(error.localizedDescription)
            operate()
        }
        
        while isOpen {
            executeBankingOperation()
        }
    }
    
    private func shouldOpenBank(by input: String) -> Bool {
        if input == "1" {
            return true
        } else {
            print("종료되었습니다.")
            return false
        }
    }
    
    private mutating func executeBankingOperation() {
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
