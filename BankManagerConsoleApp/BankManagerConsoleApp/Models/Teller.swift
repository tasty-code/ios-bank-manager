//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/07.
//

import Foundation

protocol TellerProtocol {
    func service(to customer: Customer, completion: @escaping () -> Void)
}

protocol TellerWorkingStateNotifiable: AnyObject {
    func notifyCustomerDidMatch(teller: Teller, customer: Customer)
}

struct Teller: TellerProtocol {
    private let semaphore: DispatchSemaphore
    private weak var bankManager: TellerWorkingStateNotifiable?
    
    init(tellerCount: Int, bankManager: TellerWorkingStateNotifiable) {
        self.semaphore = DispatchSemaphore(value: tellerCount)
        self.bankManager = bankManager
    }
    
    func service(to customer: Customer, completion: @escaping () -> Void) {
        semaphore.wait()
        
        DispatchQueue.main.async {
            self.bankManager?.notifyCustomerDidMatch(teller: self, customer: customer)
        }
        
        Thread.sleep(forTimeInterval: customer.workType.timeCost)
        semaphore.signal()
        completion()
    }
}
