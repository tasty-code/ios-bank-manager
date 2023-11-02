//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

final class Bank {
    
    private var totalTime: Double = 0
    private var entranceCount: Int = 0
    private var exitCount: Int = 0
    private let waitingLine = Queue<Customer>()
    
    func open(with numberOfCustomer: Int) {
        entranceCount = numberOfCustomer
        lineUpCustomer()
        startService()
    }
    
    private func lineUpCustomer() {
        for i in 1...entranceCount {
            waitingLine.enqueue(Customer(ticketNumber: i))
        }
    }
    
    private func clear() {
        entranceCount = 0
        exitCount = 0
    }
    
    private func startService() {
        let queue = DispatchQueue(label: "worker")
        let group = DispatchGroup()
        
        while entranceCount > exitCount {
            guard let frontCustomer = waitingLine.dequeue() else { break }
            
            queue.async(group: group) { [weak self] in
                self?.provideService(to: frontCustomer)
            }
        }
        
        group.wait()
        close()
    }
    
    private func close() {
        print("업무가 마감되었습니다. 오늘 처리한 고객은 총 \(entranceCount)명이며, 총 업무시간은 \(totalTime.toString(toDecimalPlace: 2))초 입니다")
        clear()
    }
    
    private func provideService(to target: Customer) {
        print("\(target.ticketNumber)번 업무 시작")
        sleep(UInt32(0.7))
        
        print("\(target.ticketNumber)번 업무 종료")
        totalTime += 0.7
        exitCount += 1
    }
}










