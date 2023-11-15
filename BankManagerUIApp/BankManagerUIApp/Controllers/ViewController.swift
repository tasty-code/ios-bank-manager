//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import UIKit

final class ViewController: UIViewController {
    private let bankView = BankView()
    private var bank: Bank = Bank()
    
    private var timer: Timer?
    private var count: Double = 0
    private var isTimerRunning: Bool = false
    
    override func loadView() {
        view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bank.uiUpdaterDelegate = self
        bankView.configureView()
        
        bankView.addCustomerButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(resetButtontapped), for: .touchUpInside)
    }
    
    @objc func startButtonTapped() {
        if let currentTimer = self.timer {
            currentTimer.invalidate()
        }
        bank.lineUp()
        
        bank.startService {
            print("complete")
            self.timer?.invalidate()
            self.isTimerRunning = false
        }
        
        isTimerRunning = false
        
        guard !isTimerRunning else { return }
        
        isTimerRunning = true
        self.timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        if let timer = self.timer {
            RunLoop.main.add(timer, forMode: .common)
        }
    }
    
    @objc func resetButtontapped() {
        resetTimer()
        resetUI()
    }
}


extension ViewController {
    @objc func updateTimer() {
        count += 0.001
        let formattedString = formatTimeInterval(count)
        bankView.workTimeLabel.text = "업무시간 - \(formattedString)"
    }
    
    func stopTimer() {
        timer?.invalidate()
        isTimerRunning = false
    }
    
    func resetTimer() {
        bank.cancelService()
        stopTimer()
        timer = nil
        count = 0
        
        let formattedString = formatTimeInterval(count)
        bankView.workTimeLabel.text = "업무시간 - \(formattedString)"
    }
    
    func formatTimeInterval(_ interval: Double) -> String {
        let minutes = Int((interval.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((interval * 1000).truncatingRemainder(dividingBy: 1000))
        return String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
    }
    
    func resetUI() {
        bankView.waitingListView.itemListStackView.arrangedSubviews.forEach {
            bankView.waitingListView.itemListStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        bankView.workingListView.itemListStackView.arrangedSubviews.forEach {
            bankView.workingListView.itemListStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
            
        }
    }
}

extension ViewController: UIUpdatable {
    func removeFinishedLabel(_ target: Customer) {
        let labelText = "\(target.ticketNumber) - \(target.serviceType.description)"
        let subView = bankView.workingListView.itemListStackView.arrangedSubviews.filter {
            guard let label = $0 as? UILabel else { return false }
            return label.text == labelText
        }.first
        
        guard let subView = subView else { return }
        bankView.workingListView.itemListStackView.removeArrangedSubview(subView)
        subView.removeFromSuperview()
    }
    
    func checkQueueEnded() {
        DispatchQueue.main.sync {
            if bankView.waitingListView.itemListStackView.arrangedSubviews.count == 0 {
                stopTimer()
            }
        }
    }
    
    func addLabel(_ target: Customer) {
        let label = UILabel(text: "\(target.ticketNumber) - \(target.serviceType.description)", fontSize: 18, textColor: target.serviceType == .deposit ? .black : .systemPurple)
        bankView.waitingListView.itemListStackView.addArrangedSubview(label)
    }
    
    func moveLabelToWorkStation(_ target: Customer) {
        let subViews = bankView.waitingListView.itemListStackView.arrangedSubviews
        
        for view in subViews {
            if let label = view as? UILabel, label.text == "\(target.ticketNumber) - \(target.serviceType.description)" {
                bankView.waitingListView.itemListStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
                
                bankView.workingListView.itemListStackView.addArrangedSubview(view)
            }
        }
    }
}
