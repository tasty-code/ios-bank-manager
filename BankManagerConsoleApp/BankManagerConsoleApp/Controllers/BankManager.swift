import Foundation

final class BankManager {
    private let bank = Bank()
    private var isRunning: Bool = false
    private var numberOfCustomer: Int {
        return Int.random(in: 10...30)
    }
    
    func run() {
        isRunning = true
        
        while isRunning {
            print("1: 실행, 2: 종료")
            
            if let userInput = readLine() {
                switch userInput {
                case "1":
                    bank.open(with: numberOfCustomer)
                    
                case "2":
                    exit()
                    
                default:
                    return
                }
            }
        }
    }
    
    private func exit() {
        isRunning = false
    }
}


