//
//  Bankable.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/1/23.
//

import Foundation

protocol Bankable: AnyObject {
    func taskBegin(customerCount: Int) -> (taskProcessingTime: Double, handledCustomer: Int)
}
