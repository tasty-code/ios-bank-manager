//
//  Double.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/2/23.
//

import Foundation

extension Double {
    func toString(toDecimalPlace: Int) -> String {
        return String(format: "%.\(toDecimalPlace)f", self)
    }
}
