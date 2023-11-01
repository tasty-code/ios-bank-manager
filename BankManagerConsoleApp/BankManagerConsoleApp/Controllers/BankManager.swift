//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let bank = Bank()
    let userInput = readLine()
    var isRunning: Bool = false
    
    //임시네이밍
    let entranceCount: Int = Int.random(in: 10...30)
    let exitCount: Int = 0
    
    
    mutating func run() {
        isRunning = true
        
        while isRunning {
            guard userInput != "2" else {
                isRunning = false
                break
            }
            
            for i in 1...entranceCount {
                bank.waitingList.enqueue(Customer(ticketNumber: i))
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
}
