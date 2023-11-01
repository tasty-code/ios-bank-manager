import Foundation

while true {
    print("1 : 은행 개점 \n2 : 종료")
    print("입력 : ", terminator: "")
    guard let userInput = readLine() else { break }
    
    if userInput == "1" {
        let bankManager = BankManager(bankClerk: 1)
        
        bankManager.start()
        bankManager.finishTask()

        
    } else if userInput == "2" {
        break
    } else {
        // 에러 처리
    }
}
