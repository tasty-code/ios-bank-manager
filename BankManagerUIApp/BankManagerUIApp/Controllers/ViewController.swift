//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import UIKit

final class ViewController: UIViewController {
    private let bankView = BankView()
    private var timer: Timer?
    private var startTime: Date?
    
    @objc private func updateTimer() {
        guard let startTime = startTime else { return }
        let elapsedTime = Date().timeIntervalSince(startTime)
        let formattedString = formatTimeInterval(elapsedTime)
        bankView.workTimeLabel.text = "업무시간 - \(formattedString)"
    }
    
    private func formatTimeInterval(_ interval: TimeInterval) -> String {
        let hours = Int(interval / 3600)
        let minutes = Int((interval.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((interval * 1000).truncatingRemainder(dividingBy: 1000))
        
        return String(format: "%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
    }
    
    override func loadView() {
        view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankView.configureUI()
        
        startTime = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .tracking)
        
        for i in 1...30 {
            let label: UILabel = {
                let label = UILabel()
                label.text = "Label \(i)"
                label.backgroundColor = UIColor.lightGray
                label.textAlignment = .center
                label.heightAnchor.constraint(equalToConstant: 50).isActive = true
                return label
            }()
            
            let label2: UILabel = {
                let label = UILabel()
                label.text = "Label \(i)"
                label.backgroundColor = UIColor.lightGray
                label.textAlignment = .center
                label.heightAnchor.constraint(equalToConstant: 50).isActive = true
                return label
            }()
            
            bankView.waitingListView.itemListStackView.addArrangedSubview(label)
            bankView.workingListView.itemListStackView.addArrangedSubview(label2)
        }
    }
}
