import Foundation

var isBankOpen = true

while isBankOpen {
    print("1 : 은행 개점 \n2 : 종료")
    print("입력 : ", terminator: "")
    
    guard let userInput = readLine() else { break }
    let group = DispatchGroup()
    switch userInput {
    case "1":
        let bankManager = BankManager(tellerCount: 1)
        group.enter()
        bankManager.startTask(group: group)
        group.wait()
        bankManager.finishTask()
    case "2":
        isBankOpen = false
    default:
        print("잘못된 입력")
    }
}
