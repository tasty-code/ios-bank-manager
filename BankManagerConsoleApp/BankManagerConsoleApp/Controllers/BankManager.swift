import Foundation

struct BankManager {
    
    private var bank: Bank
    private var view: ConsoleTextView = ConsoleTextView()
    private var isRunning: Bool = true
    
    init(bank: Bank) {
        self.bank = bank
    }
}

// MARK: - BankManager Method
extension BankManager {
    
    mutating func startBusiness() {
        printMenu()
        switchMenu(userInput())
    }
    
    private func printMenu() {
        print()
        view.printMessage(input: CustomString.printMenuText, inputTerminator: CustomString.isEmptyText)
    }
    
    private mutating func switchMenu(_ input: String) {
        switch input {
        case InputNumber.one.rawValue:
//            enqueueCustomer()
            dequeueCustomer()
            printEndMessage()
            formIsRunning()
        case InputNumber.two.rawValue:
//            view.printMessage(input: CustomString.bankClose.description)
            formIsRunning()
        default:
//            view.printMessage(input: CustomString.wrongInputMessage.description)
            startBusiness()
        }
    }
    
    private func enqueueCustomer(_ input: Int) {
        for number in 0...input {
//            bank.enqueueCustomer(inputCustomerNumber: )
        }
    }
    
    private mutating func dequeueCustomer() {
//        for number in 0...bank.fetchCustomerCount() {
//            view.printMessage(input: CustomString.startCustomerBusiness(number).description)
//            bank.formTime(add: 0.7)
//            sleepMilliseconds(0.7)
//            bank.dequeueCustomer()
//            view.printMessage(input: CustomString.endCustomerBusiness(number).description)
//        }
    }
    
    private func userInput() -> String {
        guard let userInput = readLine() else {
            return CustomString.isEmptyText.description
        }
        return userInput
    }
    

    
    private func printEndMessage() {
//        view.printMessage(input: CustomString.resultBusiness(bank.fetchCustomerCount(), bank.fetchTime()).description)
    }
    
    func fetchIsRunning() -> Bool {
        return isRunning
    }
    
    mutating func formIsRunning() {
        isRunning.toggle()
    }
    
    func sleepMilliseconds(_ milliseconds: Double) {
        let result = UInt32(milliseconds * 10)
        usleep(useconds_t(result * 100000))
    }
}
