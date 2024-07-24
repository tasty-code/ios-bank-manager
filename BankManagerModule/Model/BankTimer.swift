//
//  BankTimer.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/8/24.
//

import Foundation

final class BankTimer {
    private static let interval: TimeInterval = 0.001
    
    private let delegate: BankTimerDelegate
    
    private var milliseconds: Int = 0
    
    private var timer: Timer?
    
    init(delegate: BankTimerDelegate) {
        self.delegate = delegate
        self.milliseconds = 0
    }
    
    func start() {
        self.timer = makeTimer()
        self.timer?.fire()
    }
    
    func end() {
        self.timer?.invalidate()
    }
    
    func reset() {
        end()
        self.milliseconds = 0
        let string = format()
        self.delegate.handleUpdating(timeString: string)
    }
    
    private func makeTimer() -> Timer {
        let timer = Timer.scheduledTimer(withTimeInterval: Self.interval, repeats: true) { timer in
            self.milliseconds += 1
            let formattedString = self.format()
            self.delegate.handleUpdating(timeString: formattedString)
        }
        return timer
    }
    
    private func format() -> String {
        return String(
            format: "%02d:%02d:%03d",
            self.milliseconds / 60_000,
            (self.milliseconds % 60_000) / 1_000,
            self.milliseconds % 1_000
        )
    }
}

protocol BankTimerDelegate {
    func handleUpdating(timeString: String)
}
