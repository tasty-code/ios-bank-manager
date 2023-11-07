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
    
    private func startMenu(_ input: Int) {
        switch input {
        case 1:
            bank.prepareWork()
            let customerCount = bank.prepareCloseWork()
            close(customerCount)
        case 2:
            exit(0)
        default:
            inputError()
        }
    }
    
    func run() {
        while true {
            showMenu()
            let input = checkInput()
            startMenu(input)
        }
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
    
    func close(_ customerCount: Int) {
        let cost = round(Double(customerCount) * Banker.delay * 100) / 100
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(cost) 초 입니다.")
    }
}
