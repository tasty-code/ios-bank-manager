final class BankManager {
    var banker: Banker = Banker()
    
    func openBank() {
        BankMessage.menu.message()
        guard let choice = readLine() else { return }
        switch choice {
        case "1":
            banker.sum()
        case "2":
            return
        default :
            BankMessage.wrongInput.message()
        }
    }
}

