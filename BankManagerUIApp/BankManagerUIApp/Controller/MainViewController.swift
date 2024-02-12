//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private let mainView: MainView
    private let manager: BankManager
    private var startTime: Date?
    private var isTimerRepeats: Bool = false
    
    init(manager: BankManager) {
        self.mainView = MainView()
        self.manager = manager
        super.init(nibName: nil, bundle: nil)
        manager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        view.backgroundColor = .white
    }
    
    @objc func addCustomerButtonTapped() {
        countElapsedTime()
        manager.addCustomer()
        manager.startBankingProcess(completion: stopTimer)
    }
    
    @objc func resetService() {
        manager.reset()
        stopTimer()
    }
    
    private func stopTimer() {
        startTime = nil
        isTimerRepeats = false
        mainView.setTimer("업무시간 - 00:00:000")
    }
    
    private func countElapsedTime() {
        if !isTimerRepeats {
            startTime = Date()
            isTimerRepeats = true
        }
        DispatchQueue.global().async {
            while self.isTimerRepeats {
                Thread.sleep(forTimeInterval: 0.005)
                let now = Date()
                guard let start = self.startTime else {
                    return
                }
                let elapsedTime = now.timeIntervalSince(start)
                let minutes = Int(elapsedTime) / 60
                let seconds = Int(elapsedTime) % 60
                let milliseconds = Int(elapsedTime * 1000) % 1000
    
                let timeString = String(format: "%02d:%02d:%03d", minutes, seconds, milliseconds)
                DispatchQueue.main.async {
                    self.mainView.setTimer("업무시간 - \(timeString)")
                }
            }
        }
    }
}

extension MainViewController {
    func showCustomerView(_ customers: [Customer], isWaiting: Bool) {
        mainView.appendCustomerView(customers, isWaiting: isWaiting)
    }
}
