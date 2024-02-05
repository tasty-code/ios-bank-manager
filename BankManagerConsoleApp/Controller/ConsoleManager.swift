
struct ConsoleManager {
    private var isOpen: Bool = false
    private var customerManager: CustomerManager = CustomerManager()
    private var bankManager: BankManager = BankManager()
    
    mutating func operate() {
        isOpen = false
        printMenuOfBank()
        do {
            let input = try selectedByUser()
            isOpen = doorTrigger(by: input)
        } catch {
            print(error.localizedDescription)
            operate()
        }
        while isOpen {
            executeBankingOperation()
        }
    }
    
    private func doorTrigger(by input: String) -> Bool {
        if input == "1" {
            return true
        } else {
            print("종료되었습니다.")
            return false
        }
    }
    
    private mutating func executeBankingOperation() {
        customerManager.resetCustomer()
        customerManager.createCustomer()
        customerManager.registerCustomer(with: customerManager.customers)
        bankManager.createEmployee()
        bankManager.handleCustomerTasks(with: customerManager)
        bankManager.reportDeadlineSummary(with: customerManager)
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
