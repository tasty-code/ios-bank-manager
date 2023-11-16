//
//  BankUIDelegate.swift
//  BankManagerUIApp
//
//  Created by 김준성 on 11/15/23.
//

import UIKit

protocol BankUIDelegate: UIViewController {
    func handleWaitingCustomer(customerLabel: CustomerLabel)
    func handleProcessingCustomer(customerLabel: CustomerLabel)
    func handleProcessedCustomer(customerLabel: CustomerLabel)
}
