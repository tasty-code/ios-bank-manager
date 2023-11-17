//
//  WorkTimer.swift
//  BankManagerUIApp
//
//  Created by Janine on 11/16/23.
//

import Foundation

final class WorkTimer {
    private var timer: Timer?
    private var count: Double = 0
    
    weak var delegate: UIUpdateDelegate?
    
    func start() {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    
        if let timer = timer {
            RunLoop.main.add(timer, forMode: .tracking)
        }
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    func reset() {
        stop()
        timer = nil
        count = 0
        delegate?.updateTimerLabel(count)
    }
    
    @objc func updateTime() {
        count += 0.001
        delegate?.updateTimerLabel(count)
    }
}
