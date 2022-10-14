//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/14.
//

import Foundation

protocol BankManager {
    var clientNumber: Int { get set}
    var workTime: Double { get set }
    var clientQueue: Queue<Int>? { get set }
    
    mutating func openBank()
    mutating func startWork()
    mutating func bankService(for client: Int)
}

extension BankManager {
    mutating func showMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 :", terminator: " ")
        guard let input = readLine() else { return }
            
        switch input {
        case Menu.bankOpen.rawValue:
            startWork()
        case Menu.BankClose.rawValue:
            break
        default:
            print("잘못 입력하셨습니다.")
            showMenu()
        }
    }
    
    func generateRandomClientNumber() -> Int {
        Int.random(in: 10...30)
    }
    
    mutating func inputClient(clientNumber: Int) -> Queue<Int> {
        var queue = Queue<Int>()
        
        for i in 1...clientNumber {
            queue.enqueue(i)
        }
        
        return queue
    }
}
