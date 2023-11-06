import Foundation

var isReady = true

while isReady {
    print("1 : 은행 개점 \n2 : 종료")
    print("입력 : ", terminator: "")
    
    guard let userInput = readLine() else { break }
    
    switch userInput {
    case "1":
        let bankManager = BankManager(depositTellerCount: 2, loanTellerCount: 1)
        bankManager.openBank()
        bankManager.finishTask()
    case "2":
        isReady = false
    default:
        print("잘못된 입력")
    }
}
