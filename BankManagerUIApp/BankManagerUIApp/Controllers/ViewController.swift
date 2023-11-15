//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import UIKit

final class ViewController: UIViewController {
    private let mainView = BankView()
    private var bank: Bank = Bank()
    
    private var timer: Timer?
    private var count: Double = 0
    private var isTimerRunning: Bool = false
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bank.UIUpdater = self
        mainView.configureView()
        
        mainView.addCustomerButton.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(resetButtontapped), for: .touchUpInside)
    }
    
    @objc func addCustomerButtonTapped() {
        self.timer?.invalidate()
        
        bank.lineUp()
        bank.startService()
        
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
        mainView.workTimeLabel.text = "업무시간 - \(formattedString)"
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
        mainView.workTimeLabel.text = "업무시간 - \(formattedString)"
    }
    
    func formatTimeInterval(_ interval: Double) -> String {
        let minutes = Int((interval.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((interval * 1000).truncatingRemainder(dividingBy: 1000))
        return String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
    }
    
    func resetUI() {
        mainView.waitingListView.itemListStackView.arrangedSubviews.forEach {
            mainView.waitingListView.itemListStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        mainView.workingListView.itemListStackView.arrangedSubviews.forEach {
            mainView.workingListView.itemListStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
            
        }
    }
}

extension ViewController: UIUpdatable {
    func addLabelToWaitingStation(_ target: Customer) {
        let label = UILabel(text: "\(target.ticketNumber) - \(target.serviceType.description)", fontSize: 18, textColor: target.serviceType == .deposit ? .black : .systemPurple)
        mainView.waitingListView.itemListStackView.addArrangedSubview(label)
    }
    
    func moveLabelToWorkStation(_ target: Customer) {
        let subViews = mainView.waitingListView.itemListStackView.arrangedSubviews
        
        for view in subViews {
            if let label = view as? UILabel, label.text == "\(target.ticketNumber) - \(target.serviceType.description)" {
                mainView.waitingListView.itemListStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
                
                mainView.workingListView.itemListStackView.addArrangedSubview(view)
            }
        }
    }
    
    func removeLabelWhenFinished(_ target: Customer) {
        let labelText = "\(target.ticketNumber) - \(target.serviceType.description)"
        let subView = mainView.workingListView.itemListStackView.arrangedSubviews.filter {
            guard let label = $0 as? UILabel else { return false }
            return label.text == labelText
        }.first
        
        guard let subView = subView else { return }
        
        mainView.workingListView.itemListStackView.removeArrangedSubview(subView)
        subView.removeFromSuperview()
    }
    
    func stopTimerWhenAllWorkDone() {
        DispatchQueue.main.async { [weak self] in
            if self?.mainView.waitingListView.itemListStackView.arrangedSubviews.count == 0 {
                self?.stopTimer()
            }
        }
    }
}
