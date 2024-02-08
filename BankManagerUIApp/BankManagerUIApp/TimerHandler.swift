//
//  TimerHandler.swift
//  BankManagerUIApp
//
//  Created by ㅣ on 2/8/24.
//

import Foundation


final class  TimerHandler {
    
    private var timer = Timer()
    private var count = 0
    private(set) var timeString = ""

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.00001, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter() {
        count += 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        self.timeString = timeString
    }
    
    private func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    
    private func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }

}
