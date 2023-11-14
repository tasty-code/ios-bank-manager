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
        bankView.configureView()
        
        bankView.addCustomerButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(resetButtontapped), for: .touchUpInside)
        
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
