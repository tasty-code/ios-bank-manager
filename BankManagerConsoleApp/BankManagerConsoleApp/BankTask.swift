//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/6/23.
//

import Foundation

protocol BankTask {
    static var semaphore: DispatchSemaphore { get }
    static var dispatchQueue: DispatchQueue { get }
    
    var name: String { get }
    var processingTime: Double { get }
    
    init()
}
