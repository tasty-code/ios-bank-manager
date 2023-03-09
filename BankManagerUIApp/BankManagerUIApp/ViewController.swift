//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
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
        button.setTitle(BankTextCollection.addCustomer, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(BankTextCollection.reset, for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let buttonStackView = BasicStackView(axis: .horizontal)
    
    //MARK: - Properties: TimerLabels & Stack
    
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.text = BankTextCollection.task
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "00:00:000"
        return label
    }()
    
    private let timerLabelStackView = BasicStackView(axis: .horizontal)

    //MARK: - Properties: StateLabels & Stack
    
    private let standbyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35)
        label.text = BankTextCollection.standby
        label.textColor = .white
        label.backgroundColor = .designSystem(.mainGreen)
        label.textAlignment = .center
        
        return label
    }()
    
    private let inprogressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35)
        label.text = BankTextCollection.inprogress
        label.textColor = .white
        label.backgroundColor = .designSystem(.mainPurple)
        label.textAlignment = .center
        
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
        buttonStackView.addArrangedSubview(addCustomersButton)
        buttonStackView.addArrangedSubview(resetButton)
        
    }
    
    private func setTimerLabelStackView() {
        timerLabelStackView.addArrangedSubview(taskLabel)
        timerLabelStackView.addArrangedSubview(timerLabel)

    }
    
    private func setProgressStackView() {
        progressStackView.addArrangedSubview(standbyLabel)
        progressStackView.addArrangedSubview(inprogressLabel)
    }
    
    private func setInterfaceStackView() {
        interfaceStackView.addArrangedSubview(buttonStackView)
        interfaceStackView.addArrangedSubview(timerLabelStackView)
        interfaceStackView.addArrangedSubview(progressStackView)
        
        interfaceStackView.translatesAutoresizingMaskIntoConstraints = false
        interfaceStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        interfaceStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        interfaceStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        interfaceStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    }
    
    private func setCustomerWaitingStack() {
        waitingStackView.translatesAutoresizingMaskIntoConstraints = false
        waitingStackView.topAnchor.constraint(equalTo: interfaceStackView.bottomAnchor, constant: 15).isActive = true
        waitingStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        waitingStackView.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width/2).isActive = true
        
    }
    
    private func setCustomerInprogressStack() {
        inprogressStackView.translatesAutoresizingMaskIntoConstraints = false
        inprogressStackView.topAnchor.constraint(equalTo: interfaceStackView.bottomAnchor, constant: 15).isActive = true
        inprogressStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        inprogressStackView.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width/2).isActive = true
        
    }
    
    //MARK: - UI Action
    
    @objc
    private func addCustomerButtonTapped() {
        waitingStackView.addArrangedSubview(CustomerInfoView(frame: .zero))
        print(#function)
        startTimer()
    }
    
    @objc
    private func resetButtonTapped() {
        print(#function)
        stopTimer()
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
        
        self.timerLabel.text = String(format: "%02d:%02d:%03d", minutes, seconds, microseconds)
    }
}

