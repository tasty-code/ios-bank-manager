//
//  TellerProvidable.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/27.
//

import Foundation

protocol TellerProvidable {
    func working()
    func call(waitingNumber: UInt, result: Bool)
}
