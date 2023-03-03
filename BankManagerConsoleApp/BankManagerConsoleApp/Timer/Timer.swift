//
//  Timer.swift
//  BankManagerConsoleApp
//
//  Created by J.E on 2023/03/03.
//

import Foundation

struct Timer {
    private var startTime: CFAbsoluteTime
    private var finishTime: CFAbsoluteTime
    
    init() {
        self.startTime = CFAbsoluteTime()
        self.finishTime = CFAbsoluteTime()
    }
    
    mutating func start() {
        startTime = CFAbsoluteTimeGetCurrent()
    }
    
    mutating func finish() {
        finishTime = CFAbsoluteTimeGetCurrent()
    }
    
    func sum() -> Double {
        return finishTime - startTime
    }
}
