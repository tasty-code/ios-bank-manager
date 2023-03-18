//
//  TimerModel.swift
//  BankManagerUIApp
//
//  Created by 송선진 on 2023/03/10.
//

import UIKit

final class TimerModel {
    
    weak var timerDelegate: TimerDelegate?
    weak var timer: Timer?
    
    private var time: Int = 0 {
        didSet {
            timerDelegate?.updateTime()
        }
    }
    
    func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { time in
            
            self.time += 1
        }
    }
    
    func stopTimer() {
        self.timer?.invalidate()
    }
    
    func updateTimerLabel() -> String {
        // 분
        let minutes = self.time / 60000
        // 초
        let seconds = (self.time / 1000) % 60
        // 마이크로초
        let microseconds = self.time % 1000
        
        let timeToString = String(format: " %02d:%02d:%03d", minutes, seconds, microseconds)

        return timeToString
    }
    
}
