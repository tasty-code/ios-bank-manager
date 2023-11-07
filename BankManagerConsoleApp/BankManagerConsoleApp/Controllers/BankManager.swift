import Foundation

final class BankManager {
    private let bank = Bank()
    private var initialCustomers: Int {
        return Int.random(in: 10...30)
    }
    
    private var numberOfCurrentCustomers: Int = 0
    
    func launch() {
        print(Prompt.appLaunch, terminator: " ")
        if let userInput = readLine(), let menu = Menu(rawValue: userInput) {
            switch menu {
            case .onGoing:
                enqueueCustomers(upTo: initialCustomers)
                bank.runService()
                launch()
                
            case .finished:
                return
            }
        }
    }
}

extension BankManager {
    func enqueueCustomers(upTo numberOfCustomers: Int) {
        for i in numberOfCurrentCustomers + 1...numberOfCurrentCustomers + initialCustomers {
            bank.lineUp(Customer(ticketNumber: i))
        }
        
        numberOfCurrentCustomers += numberOfCustomers
    }
}
