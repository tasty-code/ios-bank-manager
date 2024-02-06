//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let bankView = BankView()
    private var timer: Timer?
    private var initialTime = 0.000
    private let bankManager =  BankManager(bankClerk: [.deposit: BankClerk(work: .deposit), .loan: BankClerk(work: .loan)])
    private var count = 1
    
    override func loadView() {
        view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankView.addCustomerButton.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc func addCustomerButtonTapped() {
        for num in count...count + 9 {
            let customer = Customer(banking: Banking.allCases.randomElement(), numOfPerson: num)
            bankManager.standBy(customer: customer)
            bankView.waitStackView.addArrangedSubview(CustomerLabel(customer: customer))
        }
        
        count += 10
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(runningTimer), userInfo: nil, repeats: true)
    }
    
    @objc func resetButtonTapped() {
        bankManager.stop()
        
        for subView in bankView.waitStackView.arrangedSubviews {
            subView.removeFromSuperview()
        }
        
        timer?.invalidate()
        timer = nil
        initialTime = 0.000
        bankView.taskTimeLabel.text = "업무시간 - 00:00:000"
        
        count = 1
    }
    
    @objc func runningTimer() {
        let minutes = Int(initialTime) / 60
        let seconds = Int(initialTime) % 60
        let milliSeconds = Int((initialTime.truncatingRemainder(dividingBy: 1)) * 1000)
        
        bankView.taskTimeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds, milliSeconds)
        initialTime += 0.001
    }
}

