final class BankManager {
    var customerQueue = Queue<Customer>()
    var count = Int()
    
    func openBank() {
        BankMessage.menu.message()
        guard let choice = readLine() else { return }
        switch choice {
        case "1":
            print("시작")
        case "2":
            return
        default :
            BankMessage.wrongInput.message()
        }
    }
}

