//
//  TellerProvidable.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

protocol TellerProvidable {
    
    var task: Task { get }
    var semaphore: DispatchSemaphore { get }
    
    func work(completion: (Bool)->Void)
                                                
}
