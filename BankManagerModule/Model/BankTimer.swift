//
//  BankTimer.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/8/24.
//

import Foundation

final class BankTimer {
    private static let interval: TimeInterval = 0.001
    
    private let receiver: (String) -> Void
    
    private var milliseconds: Int = 0
    
    private lazy var timer: Timer = {
        let timer = Timer.scheduledTimer(withTimeInterval: Self.interval, repeats: true) { timer in
            self.milliseconds += 1
            let formattedString = self.format()
            self.receiver(formattedString)
        }
        return timer
    }()
    
    init(receiver: @escaping (String) -> Void) {
        self.receiver = receiver
        self.milliseconds = 0
    }
    
    func start() {
        self.timer.fire()
    }
    
    func end() {
        self.timer.invalidate()
    }
    
    func reset() {
        self.milliseconds = 0
        let string = format()
        receiver(string)
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
