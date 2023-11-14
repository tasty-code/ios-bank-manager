//
//  TimeInterval.swift
//  BankManagerUIApp
//
//  Created by 전성수 on 11/14/23.
//

import Foundation

extension TimeInterval {
    func formatTimer() -> String {
        let processingTime = Double(self)
        let miliseconds = Int(processingTime.truncatingRemainder(dividingBy: 1) * 1000)
        let seconds = Int(processingTime)
        let minutes = seconds / 60
        
        return String(format: "%02d:%02d:%03d", minutes, seconds % 60, miliseconds)
    }
}
