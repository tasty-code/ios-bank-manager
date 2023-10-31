//
//  String.swift
//  BankManagerConsoleApp
//
//  Created by Swain Yun on 10/31/23.
//

import Foundation

extension Double {
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asStringWithTwoDecimals() -> String {
        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? ""
    }
}
