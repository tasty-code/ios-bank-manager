//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/22.
//

import Foundation

struct Banker: BankerProtocol {

    var processingTime: Double

     func work(of currentCustomerNumber: Int, for workType: String) {
         print(workStart(of: currentCustomerNumber, for: workType))
         Thread.sleep(forTimeInterval: processingTime)
         print(workComplete(of: currentCustomerNumber, for: workType))
     }
}
