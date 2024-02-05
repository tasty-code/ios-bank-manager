
struct ConsoleManager {
    private var isOpen: Bool = false
    private var customerManager: CustomerManager = CustomerManager()
    private var bankManager: BankManager = BankManager()
    
    mutating func operate() {
        printMenuOfBank()
        do {
            let input = try selectedByUser()
            if input == "1" {
                isOpen = true
                executeBankingOperation(of: input)
            } else {
                isOpen = false
                print("종료 되었습니다")
            }
            executeBankingOperation(of: input)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private mutating func executeBankingOperation(of input: String) {
        switch input {
        case "1":
            customerManager.createCustomer()
            customerManager.registerCustomer(with: customerManager.customers)
            bankManager.createEmployee()
            bankManager.handleCustomerTasks(with: customerManager)
            bankManager.reportDeadlineSummary(with: customerManager)
            operate()
        case "2":
            print("은행종료")
        default:
            break
        }
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
