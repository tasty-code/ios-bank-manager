//
//  BankController.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/30/24.
//

final class BankController {
    private let bank: Bank
    
    init() {
        self.bank = Bank()
    }
    
    /// 사용자 입력
    func runBankApp() {
        var isRunning = true
        while isRunning {
            print("1 : 은행 개점 \n2 : 종료")
            print("입력: ",terminator: "")
            let choice = readLine()
            switch choice {
            case "1":
                bank.open()
            case "2":
                isRunning = false
            default:
                print("잘못된 입력입니다.")
            }
        }
    }
}
