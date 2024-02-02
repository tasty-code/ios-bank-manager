import Foundation

struct BankManager {
    
    private var bank: Bank
    private var view: ConsoleTextView = ConsoleTextView()
    private var isRunning: Bool = true
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    private let group = DispatchGroup()
    
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
        view.printMenuMessage(menu: CustomStringPrintMenu.printMenuText, menuTerminator: CustomStringPrintMenu.isEmptyText)
    }
    
    private mutating func switchMenu(_ input: String) {
        switch input {
        case InputNumber.one.description:
            enqueueCustomer()
            
            while !bank.fetchDepositCustomerIsEmpty() && !bank.fetchLoanCustomerIsEmpty() {
                depositFirstBanker()
                depositSecondBanker()
                loanBanker()
            }

            group.wait()
            view.printMenuMessage(menu: CustomStringPrintMenu.resultBusiness(bank.fetchCustomerCount(), bank.fetchTime()))
            formIsRunning()
        case InputNumber.two.description:
            view.printInputMessage(input: CustomStringInput.bankClose)
            formIsRunning()
        default:
            view.printInputMessage(input: CustomStringInput.wrongInputMessage)
            startBusiness()
        }
    }
    
    private func enqueueCustomer() {
        for number in 1...bank.fetchCustomerCount() {
            let custoemr = Customer(numberTicket: number, bankServices: Task.allCases.randomElement())
            custoemr.bankServices == .deposit ? bank.enqueueDepositCustomer(customerInfo: custoemr) : bank.enqueueLoanCustomer(customerInfo: custoemr)
        }
    }
    
    private mutating func dequeueLoanCustomer() {
        bank.dequeueLoanCustomer()
    }
    
    private mutating func dequeueDepositCustomer() {
        bank.dequeueDepositCustomer()
    }
    
    private mutating func depositFirstBanker() {
        guard let customer = bank.customerDepositPeek() else {
            return
        }
        
        guard let service = customer.bankServices else {
            return
        }
        
        depositSemaphore.wait()
        performDepositBusiness(for: customer, with: service)
    }
    
    private mutating func depositSecondBanker() {
        guard let customer = bank.customerDepositPeek() else {
            return
        }
        
        guard let service = customer.bankServices else {
            return
        }
        
        depositSemaphore.wait()
        performDepositBusiness(for: customer, with: service)
    }
    
    private mutating func performDepositBusiness(for customer: Customer, with service: Task) {
        view.printMenuMessage(menu: CustomStringPrintMenu.startCustomerBusiness(customer.numberTicket, service))
        dequeueDepositCustomer()
        bank.addProcessTime(0.7)
        
        DispatchQueue.global().async(group: group) { [self] in
            view.printMenuMessage(menu: CustomStringPrintMenu.endCustomerBusiness(customer.numberTicket, service))
            workProcessTime(0.7)
            depositSemaphore.signal()
        }
    }
    
    private mutating func loanBanker() {
        guard let customer = bank.customerLoanPeek() else {
            return
        }
        
        guard let service = customer.bankServices else {
            return
        }
        
        loanSemaphore.wait()
        performLoanBusiness(for: customer, with: service)
    }
    
    private mutating func performLoanBusiness(for customer: Customer, with service: Task) {
        view.printMenuMessage(menu: CustomStringPrintMenu.startCustomerBusiness(customer.numberTicket, service))
        dequeueLoanCustomer()
        bank.addProcessTime(1.1)
        
        DispatchQueue.global().async(group: group) { [self] in
            view.printMenuMessage(menu: CustomStringPrintMenu.endCustomerBusiness(customer.numberTicket, service))
            workProcessTime(1.1)
            loanSemaphore.signal()
        }
    }
    
    private func userInput() -> String {
        guard let userInput = readLine() else {
            return CustomStringPrintMenu.isEmptyText.description
        }
        return userInput
    }
    
    private func workProcessTime(_ time: TimeInterval) {
        Thread.sleep(forTimeInterval: time)
    }
    
    func fetchIsRunning() -> Bool {
        return isRunning
    }
    
    mutating func formIsRunning() {
        isRunning.toggle()
    }
}
