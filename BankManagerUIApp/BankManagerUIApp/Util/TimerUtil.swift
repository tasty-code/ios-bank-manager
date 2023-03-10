//
//  TimerUtil.swift
//  BankManagerUIApp
//
//  Created by Mason Kim on 2023/03/10.
//

import Foundation

final class TimerUtil {

    // MARK: - Private property

    private var timer: Timer?
    private let timeInterval: TimeInterval

    private var presenter: ((String) -> Void)?

    private var isRunning = false
    private var elapsedTime: TimeInterval = 0

    private let dateFormatter = DateFormatter()

    // MARK: - Lifecycle

    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
        self.dateFormatter.dateFormat = "mm:ss:SS"
    }

    // MARK: - Public

    func start() {
        guard !isRunning && timer == nil else { return }

        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
            self.updateTimeText()
        }

        isRunning = true
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }

    func reset() {
        stop()
        elapsedTime = 0
    }

    func setPresenter(closure: @escaping (String) -> Void) {
        self.presenter = closure
    }

    // MARK: - Private

    private func updateTimeText() {
        elapsedTime += timeInterval
        let formattedTime = dateFormatter.string(from: Date(timeIntervalSinceReferenceDate: elapsedTime))
        presenter?(formattedTime)
        print(formattedTime)
    }
}
