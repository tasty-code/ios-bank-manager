//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import UIKit

class BankManager {}
//    private let bank = Bank()
//    private var timer: Timer?
//    private var count: Double = 0
//    private var isTimerRunning: Bool = false
//    
//    
//    weak var delegate: BankManagerDelegate?
//    
//    
//    @objc func updateTimer() {
//        count += 0.001
//        let formattedString = formatTimeInterval(count)
//        delegate?.updateWorkTimeLabel("업무시간 - \(formattedString)")
//    }
//    
//    func startTimer() {
//        self.timer?.invalidate()
//        self.isTimerRunning = false
//    }
//    
//    guard !isTimerRunning else { return }
//    
//    isTimerRunning = true
//    timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
//    if let timer = timer {
//        RunLoop.main.add(timer, forMode: .tracking)
//    }
//        }
//
//func stopTimer() {
//    timer?.invalidate()
//    isTimerRunning = false
//}
//
//func resetTimer() {
//    bank.cancelService()
//    timer?.invalidate()
//    timer = nil
//    count = 0
//    
//    isTimerRunning = false
//    
//    let formattedString = formatTimeInterval(count)
//    delegate?.updateWorkTimeLabel("업무시간 - \(formattedString)")
//    
//}
//
//func formatTimeInterval(_ interval: Double) -> String {
//    let minutes = Int((interval.truncatingRemainder(dividingBy: 3600)) / 60)
//    let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
//    let milliseconds = Int((interval * 1000).truncatingRemainder(dividingBy: 1000))
//    return String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
//}
//}
