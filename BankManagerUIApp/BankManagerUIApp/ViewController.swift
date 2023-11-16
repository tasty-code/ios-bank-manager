//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 


import UIKit

final class ViewController: UIViewController, BankUIDelegate {
    private let bankManager = BankManager(depositTellerCount: 2, loanTellerCount: 1)
    
    private var timer: Timer = Timer()
    private var time: Double = 0
    
    private let bankView = BankView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bankManager.delegate = self
        bankManager.depositTellers.delegate = self
        bankManager.loanTellers.delegate = self
        
        view.backgroundColor = .white
        view.addSubview(bankView)
        
        configureBankView()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(setTimerLabel), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: .common)
        }
    }
    
    private func timerStop() {
        timer.invalidate()
    }
    
    func changeToLabelState(tellerType: TypeOfWork,data: Int){
        DispatchQueue.main.sync  { [self] in
            for label in bankView.readyListStackView.arrangedSubviews {
                if label.tag == data {
                    bankView.readyListStackView.removeArrangedSubview(label)
                    bankView.runningListStackView.addArrangedSubview(label)
                    break
                }
            }
        }
    }
    
    func removeLabel(data: Int) {
        DispatchQueue.main.sync  { [self] in
            for label in bankView.runningListStackView.arrangedSubviews {
                if label.tag == data {
                    label.removeFromSuperview()
                    break
                }
            }
            if bankView.runningListStackView.arrangedSubviews.isEmpty && bankView.readyListStackView.arrangedSubviews.isEmpty {
                timerStop()
            }
        }
    }
    
    func addTaskLabel(type: TypeOfWork, number: Int, textColor: UIColor){
        DispatchQueue.main.async { [self] in
            let label = bankView.configureTaskLabel(type: type, number: number, textColor: textColor)
            bankView.readyListStackView.addArrangedSubview(label)
        }
    }
 
    private func configureBankView() {
        let safeArea = view.safeAreaLayoutGuide
        
        bankView.translatesAutoresizingMaskIntoConstraints = false
        
        bankView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        bankView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        bankView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        bankView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        bankView.configure()
        bankView.setupAutoLayout()
        
        bankView.addCustomerButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
    }
}

extension ViewController {
    
    @objc private func setTimerLabel() {
        let minute = String(format: "%02d", Int(time) / 60)
        let second = String(format: "%02d", Int(time) % 60)
        let millisecond = String(format: "%03d" , Int(time * 1000) % 1000)
        
        time += 0.001
        
        bankView.timerTitleLabel.text = "\(minute) : \(second) : \(millisecond)"
    }
    
    @objc private func addCustomer() {
        bankManager.createCustomerQueue()
        
        startTimer()
        bankManager.startTask()
    }
    
    @objc private func reset() {
        let _ = bankView.readyListStackView.arrangedSubviews.map { $0.removeFromSuperview()}
        let _ = bankView.runningListStackView.arrangedSubviews.map { $0.removeFromSuperview()}
        bankManager.reset()
        timerStop()
        time = 0
        bankView.timerTitleLabel.text = "00 : 00 : 000"
    }
}

