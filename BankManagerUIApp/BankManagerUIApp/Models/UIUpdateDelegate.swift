//
//  UIUpdateDelegate.swift
//  BankManagerUIApp
//
//  Created by Janine on 11/17/23.
//

import Foundation

protocol UIUpdateDelegate: AnyObject {
    func updateUI(_ handler: @escaping () -> Void)
    func addCustomerLabel(_ customer: Customer)
    func moveCustomerLabel(_ customer: Customer)
    func removeCustomerLabel(_ customer: Customer)
    func updateTimerLabel(_ timer: Double)
    func resetAllCustomerLabel()
    
    func stopTimer()
}

extension UIUpdateDelegate {
    func updateUI(_ handler: @escaping () -> Void) {
        DispatchQueue.main.async {
            handler()
        }
    }
}
