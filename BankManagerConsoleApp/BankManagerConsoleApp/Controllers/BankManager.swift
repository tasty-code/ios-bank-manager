import Foundation

struct BankManager {
    
    private var bank: Bank = Bank(bankEmployeeCount: 1)
    private var view: ConsoleTextView = ConsoleTextView()
    private var isRunning: Bool = true
}

// MARK: - BankManager Method
extension BankManager {
    
    mutating func startBusiness() {
        printMenu()
        switchMenu(userInput())
    }
    
    private func printMenu() {
        print()
        view.printMessage(input: CustomString.printMenuText.description, inputTerminator: CustomString.isEmptyText.description)
    }
    
    private mutating func switchMenu(_ input: String) {
        switch input {
        case CustomString.numberOneText.description:
            customerEnqueue()
            customerDequeue()
            printEndMessage()
            break
        case CustomString.numberTwoText.description:
            view.printMessage(input: CustomString.bankClose.description)
            formIsRunning()
        default:
            view.printMessage(input: CustomString.wrongInputMessage.description)
            startBusiness()
        }
    }
    
    private func customerEnqueue() {
        for number in 0...bank.fetchCustomerCount() {
            bank.enqueueCustomer(inputData: number)
        }
    }
    
    private mutating func customerDequeue() {
        for number in 0...bank.fetchCustomerCount() {
            view.printMessage(input: CustomString.startCustomerBusiness(number).description)
            bank.formTime(add: 0.7)
            bank.dequeueCustomer()
            view.printMessage(input: CustomString.endCustomerBusiness(number).description)
        }
    }
    
    private func userInput() -> String {
        guard let userInput = readLine() else {
            return CustomString.isEmptyText.description
        }
        return userInput
    }
    
    private func formatTimeToTwoDecimalPlaces(_ time: Double) -> Double {
        return Double(String(format: CustomString.format.description, time)) ?? 0.0
    }
    
    private func printEndMessage() {
        view.printMessage(input: CustomString.resultBusiness(bank.fetchCustomerCount(), formatTimeToTwoDecimalPlaces(bank.fetchTime())).description)
    }
    
    func fetchIsRunning() -> Bool {
        return isRunning
    }
    
    mutating func formIsRunning() {
        isRunning.toggle()
    }
}
