final class BankManager {
    var banker: Banker
    
    init(banker: Banker) {
        self.banker = banker
    }
    
    func openBank() {
        while true {
            BankMessage.menu.message()
            guard let choice = readLine() else { return }
            switch choice {
            case "1":
                banker.taskStart()
            case "2":
                return
            default :
                BankMessage.wrongInput.message()
            }
        }
    }
}

