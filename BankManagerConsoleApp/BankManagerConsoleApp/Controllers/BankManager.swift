import Foundation

struct BankManager {
    
    private var bank: Bank
    private var view: ConsoleTextView = ConsoleTextView()
    private var isRunning: Bool = true
    
    let depositSemaphore = DispatchSemaphore(value: 2)
    let loanSemaphore = DispatchSemaphore(value: 1)
    let group = DispatchGroup()
    
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
        view.printMessage(input: CustomString.printMenuText, inputTerminator: CustomString.isEmptyText)
    }
    
    private mutating func switchMenu(_ input: String) {
        switch input {
        case InputNumber.one.rawValue:
//            enqueueCustomer()
            enqueueCustomer()
            
            while !bank.fetchDepositCustomerIsEmpty() && !bank.fetchLoanCustomerIsEmpty() {
                depositBankerOne()
                depositBankerTwo()
                loanBankerOne()
            }

            group.wait()
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
    
    private func enqueueCustomer() {
        for number in 1..<bank.fetchCustomerCount() {
            let result = Customer(numberTicket: number, bankServices: Task.allCases.randomElement())
            if result.bankServices == .deposit {
                bank.enqueueDepositCustomer(Customer: result)
            } else {
                bank.enqueueLoanCustomer(Customer: result)
            }
        }
    }
    private mutating func dequeueLoanCustomer() {
        bank.dequeueLoanCustomer()
    }
    
    private mutating func dequeueDepositCustomer() {
        bank.dequeueDepositCustomer()
    }
    
    mutating func depositBankerOne() {
        guard let customer = bank.customerDepositPeek() else { return }
        view.printMessage(input: CustomString.startCustomerBusiness(customer.numberTicket, customer.bankServices))
        depositSemaphore.wait()
        self.dequeueDepositCustomer()
        DispatchQueue.global().async(group: group) { [self] in
            view.printMessage(input: CustomString.endCustomerBusiness(customer.numberTicket, customer.bankServices))
            Thread.sleep(forTimeInterval: 0.7)
            depositSemaphore.signal()
        }
    }
    
    mutating func depositBankerTwo() {
        guard let customer = bank.customerDepositPeek() else { return }
        view.printMessage(input: CustomString.startCustomerBusiness(customer.numberTicket, customer.bankServices))
        depositSemaphore.wait()
        self.dequeueDepositCustomer()
        DispatchQueue.global().async(group: group) { [self] in
            view.printMessage(input: CustomString.endCustomerBusiness(customer.numberTicket, customer.bankServices))
            Thread.sleep(forTimeInterval: 0.7)
            depositSemaphore.signal()
        }
    }
    
    mutating func loanBankerOne() {
        guard let customer = bank.customerLoanPeek() else { return }
        view.printMessage(input: CustomString.startCustomerBusiness(customer.numberTicket, customer.bankServices))
        loanSemaphore.wait()
        self.dequeueLoanCustomer()
        DispatchQueue.global().async(group: group) { [self] in
            view.printMessage(input: CustomString.endCustomerBusiness(customer.numberTicket, customer.bankServices))
            Thread.sleep(forTimeInterval: 1.1)
            loanSemaphore.signal()
        }
    }

    
    private func userInput() -> String {
        guard let userInput = readLine() else {
            return CustomString.isEmptyText.description
        }
        return userInput
    }
    

    
    private func printEndMessage() {
        view.printMessage(input: CustomString.resultBusiness(bank.fetchCustomerCount(), bank.fetchTime()))
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
