final class BankManager {
    var banker: Banker
    
    init(banker: Banker) {
        self.banker = banker
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
                banker.taskStart()
            case "2":
                return
            default:
                print(BankManagerError.invalidInput.message)
            }
        }
    }
}
