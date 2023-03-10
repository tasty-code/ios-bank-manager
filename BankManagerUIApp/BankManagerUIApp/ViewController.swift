//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let queue = WaitingQueue<Customer>()
    private lazy var bankManager = BankManager(waitingQueue: queue)
    private var waitingNumber: UInt = 0
    
    // MARK: - Properties: Timer
    
    private lazy var time: Int = 0 {
        didSet {
            updateTimerLabel()
        }
    }
    
    weak var timer: Timer?

    //MARK: - Properties: Button
    
    private lazy var addCustomersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(UIBankTextCollection.addCustomer, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(UIBankTextCollection.reset, for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let buttonStackView = BasicStackView(axis: .horizontal)
    
    //MARK: - Properties: TimerLabels & Stack
    
    private let taskLabel: UILabel = {
        let label = BasicLabel(systemFontSize: 20, textAlignnment: .right)
        label.text = UIBankTextCollection.task
        return label
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = BasicLabel(systemFontSize: 20, textAlignnment: .left)
        label.text = " 00:00:000"
        return label
    }()
    
    private let timerLabelStackView = BasicStackView(axis: .horizontal)

    //MARK: - Properties: StateLabels & Stack
    
    private let standbyLabel: UILabel = {
        let label = BasicLabel(systemFontSize: 35, textAlignnment: .center)
        label.text = UIBankTextCollection.standby
        label.textColor = .white
        label.backgroundColor = .designSystem(.mainGreen)
        return label
    }()
    
    private let inprogressLabel: UILabel = {
        let label = BasicLabel(systemFontSize: 35, textAlignnment: .center)
        label.text = UIBankTextCollection.inprogress
        label.textColor = .white
        label.backgroundColor = .designSystem(.mainPurple)
        return label
    }()
    
    //MARK: - Properties: progress Stack
    
    private let progressStackView = BasicStackView(axis: .horizontal)
    
    //MARK: - Properties: Interface Stack
    
    private let interfaceStackView = BasicStackView(axis: .vertical)
    
    //MARK: - Properties: Waiting & Inprogress Stack
    
    private let waitingStackView = BasicStackView(axis: .vertical, alignment: .center)
    
    private let inprogressStackView = BasicStackView(axis: .vertical, alignment: .center)
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK: - UI Setting
    
    private func setUI() {
        view.addSubview(interfaceStackView)
        view.addSubview(waitingStackView)
        view.addSubview(inprogressStackView)
        
        setButtonStack()
        setTimerLabelStackView()
        setProgressStackView()
        setInterfaceStackView()
        setCustomerWaitingStack()
        setCustomerInprogressStack()
    }
    
    private func setButtonStack() {
        buttonStackView.addArrangedSubviews([addCustomersButton, resetButton])
        
    }
    
    private func setTimerLabelStackView() {
        timerLabelStackView.addArrangedSubviews([taskLabel, timerLabel])

    }
    
    private func setProgressStackView() {
        progressStackView.addArrangedSubviews([standbyLabel, inprogressLabel])
    }
    
    private func setInterfaceStackView() {
        interfaceStackView.addArrangedSubviews([buttonStackView, timerLabelStackView, progressStackView])
        
        interfaceStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        interfaceStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        interfaceStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        interfaceStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    }
    
    private func setCustomerWaitingStack() {
        waitingStackView.topAnchor.constraint(equalTo: interfaceStackView.bottomAnchor, constant: 15).isActive = true
        waitingStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        waitingStackView.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width/2).isActive = true
        
    }
    
    private func setCustomerInprogressStack() {
        inprogressStackView.topAnchor.constraint(equalTo: interfaceStackView.bottomAnchor, constant: 15).isActive = true
        inprogressStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        inprogressStackView.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width/2).isActive = true
        
    }
    
    //MARK: - UI Action
    
    @objc
    private func addCustomerButtonTapped() {
        let newCustomers = bankManager.generateWaiting(range: waitingNumber...waitingNumber + 10)
        self.waitingNumber += 10
        
        newCustomers.forEach { newCustomer in
            waitingStackView.addArrangedSubview(CustomerInfoView(
                ticketNumber: newCustomer.number,
                task: newCustomer.task.rawValue))
        }
    }
    
    @objc
    private func resetButtonTapped() {
    }
    
    
    // MARK: - Timer
    
    private func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { time in
            
            self.time += 1
        }
        
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
        
    }
    
    private func updateTimerLabel() {
        // 분
        let minutes = self.time / 60000
        // 초
        let seconds = (self.time / 1000) % 60
        // 마이크로초
        let microseconds = self.time % 1000
        
        self.timerLabel.text = String(format: " %02d:%02d:%03d", minutes, seconds, microseconds)
    }
}

