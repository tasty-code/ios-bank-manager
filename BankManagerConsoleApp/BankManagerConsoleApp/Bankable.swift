//
//  Bankable.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/1/23.
//

import Foundation

protocol Bankable: AnyObject {
    var customerQueue: Queue<Customer> { get }
    var group: DispatchGroup { get }
    
    func beginTask() -> (taskProcessingTime: Double, handledCustomer: Int)
}
