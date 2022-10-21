//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/14.
//

import Foundation

struct BankManager {
    func openBank() {
        showMenu()
        input()
    }
    
    private func showMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 :", terminator: " ")
    }
    
    private func input() {
        guard let input = readLine() else { return }
            
        switch input {
        case Menu.bankOpen.description:
            self.startWorking()
            self.openBank()
        case Menu.bankClose.description:
            break
        default:
            print("잘못 입력하셨습니다.")
            self.openBank()
        }
    }
    
    private func generateRandomClientNumber() -> Int {
        Int.random(in: Int.minRange...Int.maxRange)
    }
    
    private func createClientQueue(clientNumber: Int) -> Queue<Client> {
        var queue = Queue<Client>()
        
        for i in Int.first...clientNumber {
            let workType = Int.random(in: WorkType.loan.rawValue...WorkType.deposit.rawValue)
            if workType == WorkType.loan.rawValue {
                queue.enqueue(Client(waitNumber: i, workType: WorkType.loan))
            } else {
                queue.enqueue(Client(waitNumber: i, workType: WorkType.deposit))
            }
        }
        
        return queue
    }
    
    private func startWorking() {
        var bank = Bank()
        let clientNumber = generateRandomClientNumber()
        bank.startBank(clientQueue: createClientQueue(clientNumber: clientNumber), bankClerks: setUpBankClerk(deposit: 2, loan: 1))
        bank.dispatchGroup.wait()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientNumber)명이며, 총 업무시간은 \(roundToString(in: bank.totalTime)) 입니다.")
    }
    
    private func setUpBankClerk(deposit: Int, loan: Int) -> [WorkType: BankClerk]{
        let depositClerk = DespositClerk(count: deposit)
        let loanClerk = LoanClerk(count: loan)
        let bankClerks: [WorkType: BankClerk] = [WorkType.deposit: depositClerk, WorkType.loan: loanClerk]
        
        return bankClerks
    }
    
    private func roundToString(in workTime: Double) -> String {
            String(format: "%.2f", workTime)
    }
}
