import Foundation

final class BankManager {
    private let bank = Bank()
    private var numberOfCustomer: Int {
        return Int.random(in: 10...30)
    }
    
    func launch() {
        print(Prompt.appLaunch, terminator: " ")
        if let userInput = readLine(), let menu = Menu(rawValue: userInput) {
            switch menu {
            case .onGoing:
                bank.open(with: numberOfCustomer)
                launch()
                
            case .finished:
                return
            }
        }
    }
}


