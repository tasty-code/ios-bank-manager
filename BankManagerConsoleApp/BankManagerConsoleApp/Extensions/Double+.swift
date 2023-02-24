//
//  Double+.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/24.
//

import Foundation

extension Double {
    func round(toPlaces places: Int) -> Double {
        let digit = pow(10.0, Double(places))
        return (self * digit).rounded() / digit
    }
}
