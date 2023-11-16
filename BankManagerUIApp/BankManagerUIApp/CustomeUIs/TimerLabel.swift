//
//  TimerLabel.swift
//  BankManagerUIApp
//
//  Created by 김준성 on 11/14/23.
//

import UIKit
import Combine

final class TimerLabel: UILabel {
    private var prefix: String
    private var startTime: Date?
    private var pauseTime: TimeInterval?
    private var subscription: AnyCancellable?
    
    init(prefix: String, fontSize: CGFloat) {
        self.prefix = prefix
        super.init(frame: .zero)
        
        self.textAlignment = .center
        self.text = "\(prefix)-00:00:000"
        self.textColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.monospacedSystemFont(ofSize: fontSize, weight: .medium)
    }
    
    deinit {
        resetTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func startTimer() {
        if startTime == nil {
            startTime = Date()
        }
        
        if subscription == nil {
            subscription = Timer.publish(every: 0.001, on: .current, in: .common)
                .autoconnect()
                .sink { updatedTime in
                    guard let startTime = self.startTime
                    else {
                        fatalError("TimerLabel.startTime 언래핑 실패")
                    }
                    
                    if let pauseTime = self.pauseTime {
                        let formattedTime = (pauseTime + updatedTime.timeIntervalSince(startTime)).formatTimer()
                        self.text = "\(self.prefix)-\(formattedTime)"
                    } else {
                        self.text = "\(self.prefix)-\(updatedTime.timeIntervalSince(startTime).formatTimer())"
                    }
                }
        }
    }
    
    func pauseTimer() {
        subscription?.cancel()
        subscription = nil
        startTime = nil
        guard let formatTime = text!.formatTimer() else {
            return
        }
        pauseTime = TimeInterval(formatTime)
    }
    
    func resetTimer() {
        subscription?.cancel()
        subscription = nil
        startTime = nil
        pauseTime = nil
        text = "업무시간-00:00:000"
    }
}
