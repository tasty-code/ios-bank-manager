//
//  TimerHandler.swift
//  BankManagerUIApp
//
//  Created by ㅣ on 2/8/24.
//

import Foundation

private struct TimeUnit {
    let hours: Int
    let minutes: Int
    let seconds: Int
}

final class BankTimer {
    
    private var timer = Timer()
    private var count = 0
    var timeString: ((String) -> Void)?
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    func stop() {
        timer.invalidate()
        timeString?("00:00:00")
    }
    
    @objc private func timerCounter() {
        count += 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        var convertedTimeString = makeTimeString(time)
        timeString?(convertedTimeString)
    }
    
    private func secondsToHoursMinutesSeconds(seconds: Int) -> TimeUnit {
        return TimeUnit.init(hours: (seconds / 3600), minutes: ((seconds % 3600) / 60), seconds: ((seconds % 3600) % 60))
    }
    
    private func makeTimeString(_ timeUnit: TimeUnit) -> String {
        return String(format: "%02d:%02d:%02d", timeUnit.hours, timeUnit.minutes, timeUnit.seconds)
    }
}
