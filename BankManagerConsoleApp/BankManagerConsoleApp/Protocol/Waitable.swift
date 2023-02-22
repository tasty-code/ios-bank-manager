//
//  Waitable.swift
//  BankManagerConsoleApp
//
//  Created by 이상윤 on 2023/02/22.
//

import Foundation

protocol Waitable {
    
    var waitingOrder: Int { get }
}
