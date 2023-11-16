//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        bank = Bank(customerQueue: Queue<Customer>())
        bank?.delegate = self
        
        setupContentView()
        setConstraint()
    }
    
    private var bank: Bankable?
    
    private let contentStackView = UIStackView(axis: .vertical, spacing: 15, distribution: .fill)
    
    private let topButtonWrap = UIStackView(axis: .horizontal, spacing: 0, distribution: .fillEqually)
    
    private let stateIndiCatorWrap = UIStackView(axis: .horizontal, spacing: 0, distribution: .fillEqually)
    
    private lazy var timeLabel = TimerLabel(prefix: "업무시간", fontSize: 24)
    
    private let waitingLabel = UILabel(text: "대기중", fontSize: 35, textColor: .white, textAlignment: .center, backgroundColor: .systemGreen)
    
    private let taskingLabel = UILabel(text: "업무중", fontSize: 35, textColor: .white, textAlignment: .center, backgroundColor: .systemIndigo)
    
    private let waitingListWrap = UIStackView(axis: .vertical, spacing: 0, distribution: .fillEqually)
    
    private let taskingListWrap = UIStackView(axis: .vertical, spacing: 0, distribution: .fillEqually)
    
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let stateListWrap: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, spacing: 0, distribution: .fillEqually)
        stackView.alignment = .top
        
        return stackView
    }()
    
    private let increaseCustomerButton: UIButton = {
        let addButton = UIButton(title: "고객 10명 추가", color: .systemBlue)
        addButton.addTarget(nil, action: #selector(tapAddButton(_:)), for: .touchDown)
        
        return addButton
    }()
    
    private let resetCustomerButton: UIButton = {
        let addButton = UIButton(title: "초기화", color: .systemRed)
        addButton.addTarget(nil, action: #selector(tapResetButton(_:)), for: .touchDown)
        
        return addButton
    }()
}

extension ViewController {
    
    private func setupContentView() {
        view.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(topButtonWrap)
        topButtonWrap.addArrangedSubview(increaseCustomerButton)
        topButtonWrap.addArrangedSubview(resetCustomerButton)
        
        contentStackView.addArrangedSubview(timeLabel)
        
        contentStackView.addArrangedSubview(stateIndiCatorWrap)
        stateIndiCatorWrap.addArrangedSubview(waitingLabel)
        stateIndiCatorWrap.addArrangedSubview(taskingLabel)
        
        self.view.addSubview(contentScrollView)
        contentScrollView.addSubview(stateListWrap)
        
        stateListWrap.addArrangedSubview(waitingListWrap)
        stateListWrap.addArrangedSubview(taskingListWrap)
    }
    
    private func setConstraint() {
        self.view.backgroundColor = .white
        NSLayoutConstraint.activate([
            
            contentStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            contentStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0),
            
            contentScrollView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            
            stateListWrap.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            stateListWrap.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            stateListWrap.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            stateListWrap.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            stateListWrap.widthAnchor.constraint(equalTo: contentScrollView.frameLayoutGuide.widthAnchor, multiplier: 1.0),
        ])
    }
    
}

extension ViewController {
    @objc private func tapAddButton(_ sender: UIButton) {
        timeLabel.startTimer()
        generateCustomers()
    }
    
    @objc private func tapResetButton(_ sender: UIButton) {
        timeLabel.resetTimer()
        resetCustomers()
    }
    
    private func generateCustomers() {
        bank?.beginTask {
            self.timeLabel.pauseTimer()
        }
    }
    
    private func resetCustomers() {
        bank?.resetCustomer()
        for label in waitingListWrap.arrangedSubviews {
            if let label = label as? CustomerLabel {
                label.customer.workable = false
                label.removeFromSuperview()
            }
        }
    }
}

extension ViewController: BankUIDelegate {
    func handleWaitingCustomer(customerLabel: CustomerLabel) {
        waitingListWrap.addArrangedSubview(customerLabel)
    }
    
    func handleProcessingCustomer(customerLabel: CustomerLabel) {
        customerLabel.removeFromSuperview()
        taskingListWrap.addArrangedSubview(customerLabel)
    }
    
    func handleProcessedCustomer(customerLabel: CustomerLabel) {
        customerLabel.removeFromSuperview()
    }
}
