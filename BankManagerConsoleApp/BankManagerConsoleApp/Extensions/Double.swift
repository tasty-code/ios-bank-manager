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
    
    func timeFormatter() -> String {
        let minutes = Int((self.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((self * 1000).truncatingRemainder(dividingBy: 1000))
        return String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
    }
}
