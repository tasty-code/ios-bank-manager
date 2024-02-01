final class BankManager {
    private let bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
    }
    
    private func getUserInput() -> String? {
        do {
            guard let userInput = readLine() else {
                throw BankManagerError.invalidInput
            }
            return userInput
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func openBank() {
        while true {
            print("1 : 은행개점\n2 : 종료\n입력 :", terminator: " ")
            let choice = getUserInput()
            switch choice {
            case "1":
                bank.openBank()
            case "2":
                return
            default:
                print(BankManagerError.invalidInput.message)
            }
        }
    }
}
