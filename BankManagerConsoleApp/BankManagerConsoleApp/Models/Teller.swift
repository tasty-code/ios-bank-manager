//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/07.
//

import Foundation

final class Teller {
    let workType: WorkType
    
    init(workType: WorkType) {
        self.workType = workType
    }
    
    func service(to customer: Customer, completion: @escaping () -> Void) {
        InterfaceMessage.printStartWork(customer: customer)
        Thread.sleep(forTimeInterval: customer.workType.timeCost)
        InterfaceMessage.printCompleteWork(customer: customer)
        completion()
    }
}
