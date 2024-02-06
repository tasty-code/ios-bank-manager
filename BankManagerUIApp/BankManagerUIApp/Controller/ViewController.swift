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
    
    override func loadView() {
        view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankView.addCustomerButton.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func addCustomerButtonTapped() {
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(runningTimer), userInfo: nil, repeats: true)
    }
    
    @objc func runningTimer() {
        let minutes = Int(initialTime) / 60
        let seconds = Int(initialTime) % 60
        let milliSeconds = Int((initialTime.truncatingRemainder(dividingBy: 1)) * 1000)
        
        bankView.taskTimeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds, milliSeconds)
        initialTime += 0.001
    }


}

