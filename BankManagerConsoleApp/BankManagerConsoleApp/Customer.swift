//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/27.
//

import Foundation


struct Customer {
    
    //MARK: - Properties
    
    let task: Task
    
    //MARK: - LifeCycle
    
    init() {
        self.task =  Task.getRandomTask()
    }
    
}
