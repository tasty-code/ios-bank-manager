import Foundation

struct BankManager {
    private var bank: Bank
    
    init(bank: Bank = Bank()) {
        self.bank = bank
    }
    
    private func showMenu() {
        messageOfOpen()
        messageOfClose()
    }
    
    private func checkInput() -> Int {
        guard let input = readLine(), let input = Int(input) else {
            return 0
        }
        return input
    }
    
    private func startMenu() {
        bank.prepareWork()
        let result = bank.prepareCloseWork()
        close(result)
    }
    
    func run() {
        showMenu()
        startMenu()
    }
}

extension BankManager {
    func messageOfOpen() {
        print("1 : 은행 개점")
    }
    
    func messageOfClose() {
        print("2 : 종료")
    }
    
    func inputError() {
        print("다시 입력해 주십시오.")
    }
    
    func close(_ result: Result) {
        let elapsedTime = String(format: "%.2f", result.elapsedTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(result.customerCount)명이며, 총 업무시간은 \(elapsedTime) 초 입니다.")
    }
}
