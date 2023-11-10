import Foundation

final class BankManager {
    private let bank = Bank()
    private var numberOfCurrentCustomers: Int = 0
    private var initialCustomers: Int {
        return Int.random(in: 10...30)
    }
    
    func launch() {
        print(Prompt.appLaunch, terminator: " ")
        if let userInput = readLine(), let menu = Menu(rawValue: userInput) {
            switch menu {
            case .onGoing:
                enqueueCustomers(upTo: initialCustomers)
                bank.runService()
                resetCustomerCount()
                launch()
                
            case .finished:
                return
            }
        }
    }
}

private extension BankManager {
    func enqueueCustomers(upTo numberOfCustomers: Int) {
        for i in numberOfCurrentCustomers + 1...numberOfCurrentCustomers + numberOfCustomers {
            bank.lineUp(Customer(ticketNumber: i))
        }
        
        numberOfCurrentCustomers += numberOfCustomers
    }
    
    func resetCustomerCount() {
        numberOfCurrentCustomers = 0
    }
}
