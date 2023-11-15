//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import UIKit

final class ViewController: UIViewController {
    private let bankManager = BankManager()
    private let bankView = BankView()
    private var timer: Timer?
    private var count: Double = 0
    private var isTimerRunning: Bool = false
    
    override func loadView() {
        view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankManager.delegate = self
        bankManager.uiUpdaterDelegate = self
        bankView.configureView()
        
        bankView.addCustomerButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(resetButtontapped), for: .touchUpInside)
    }
}

extension ViewController: BankManagerDelegate {
    func updateWorkTimeLabel(_ formattedString: String) {
        bankView.workTimeLabel.text = formattedString
    }
    
    @objc func startButtonTapped() {
        bankManager.startTimer()
    }
    
    @objc func resetButtontapped() {
        bankManager.resetTimer()
    }
}

extension ViewController: UIUpdatable {
    func addLabel(_ target: Customer) {
        let label = UILabel(text: "\(target.ticketNumber) - \(target.serviceType.description)", fontSize: 18)
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
    
    func removeAll() {
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
