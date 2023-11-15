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
    var handledCustomer: Int { get }
    
    func beginTask(completionHandler: @escaping () -> Void)
    
    func assignTask(_ customer: CustomerLabel)
    func resetCustomer()
}
