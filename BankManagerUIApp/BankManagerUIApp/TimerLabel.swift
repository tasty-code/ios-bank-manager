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
        
        textAlignment = .center
        text = "\(prefix)-00:00:000"
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.monospacedSystemFont(ofSize: fontSize, weight: .medium)
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
                    if let pauseTime = self.pauseTime {
                        let formattedTime = (pauseTime + updatedTime.timeIntervalSince(self.startTime!)).formatTimer()
                        self.text = "\(self.prefix)-\(formattedTime)"
                    } else {
                        self.text = "\(self.prefix)-\(updatedTime.timeIntervalSince(self.startTime!).formatTimer())"
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
