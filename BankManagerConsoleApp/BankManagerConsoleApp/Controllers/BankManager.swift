import Foundation

final class BankManager {
    private let bank = Bank()
    private var numberOfCustomer: Int {
        return Int.random(in: 10...30)
    }
    
    func run() {
        print(Prompt.run)
        if let userInput = readLine() {
            switch userInput {
            case "1":
                bank.open(with: numberOfCustomer)
                run()
                
            case "2":
                return
                
            default:
                return
            }
        }
    }
}


