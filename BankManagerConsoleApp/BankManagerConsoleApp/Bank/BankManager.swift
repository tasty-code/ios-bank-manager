final class BankManager {
    var banker: Banker
    
    init(banker: Banker) {
        self.banker = banker
    }
    
    func openBank() {
        while true {
            print("1 : 은행개점\n2 : 종료\n입력 :", terminator: " ")
            guard let choice = readLine() else { return }
            switch choice {
            case "1":
                banker.taskStart()
            case "2":
                return
            default:
                print("1 혹은 2를 입력하세요.")
            }
        }
    }
}
