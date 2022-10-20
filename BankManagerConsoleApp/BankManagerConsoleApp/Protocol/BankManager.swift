//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/14.
//

import Foundation

protocol BankManager {
    var workTime: Double { get set }
    var clientQueue: Queue<Client>? { get set }
    
    mutating func openBank()
    mutating func startWork()
    
}

extension BankManager {
    func showMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 :", terminator: " ")
    }
    
    mutating func input() {
        guard let input = readLine() else { return }
            
        switch input {
        case Menu.bankOpen.description:
            self.startWork()
        case Menu.bankClose.description:
            break
        default:
            print("잘못 입력하셨습니다.")
            self.showMenu()
        }
    }
    
    func generateRandomClientNumber() -> Int {
        Int.random(in: Int.minRange...Int.maxRange)
    }
    
    mutating func inputClient(clientNumber: Int) -> Queue<Client> {
        var queue = Queue<Client>()
        
        for i in Int.first...clientNumber {
            let workType = Int.random(in: 1...2)
            if workType == 1 {
                queue.enqueue(Client(waitNumber: i, workType: WorkType.loan))
            } else {
                queue.enqueue(Client(waitNumber: i, workType: WorkType.deposit))
            }
            
        }
        
        return queue
    }
    
    func roundToString(in workTime: Double) -> String {
            String(format: "%.2f", workTime)
    }
}
