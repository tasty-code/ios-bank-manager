//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let queue = WaitingQueue<Customer>()
    private lazy var bankManager = BankManager(waitingQueue: queue)
    private var waitingNumber: UInt = 1
    
    // MARK: - Properties: Timer
    
    private let timer = TimerModel()
    
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
        setupDelegate()
    }
    
    //MARK: - UI Setting
    
    private func setupDelegate() {
        timer.timerDelegate = self
    }
    
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
        let group = DispatchGroup()
        let range = waitingNumber...waitingNumber + (UIBankTextCollection.customerRange - 1)
        let newCustomers = bankManager.generateWaiting(range: range)
        
        newCustomers.forEach { newCustomer in
            addLabel(into: waitingStackView, with: newCustomer)
        }
        
        self.waitingNumber += UIBankTextCollection.customerRange
        timer.startTimer()
        // 대기중 스택에서 제거 -> 업무중 스택에서 추가 -> 완료후 제거
        bankManager.dealCustomer(group: group) { customer, taskState in
            if taskState {
                self.eliminateLabel(from: self.waitingStackView, by: customer.number)
                self.addLabel(into: self.inprogressStackView, with: customer)
            }
            if !taskState {
                self.eliminateLabel(from: self.inprogressStackView, by: customer.number)
            }
        }
    }
    
    @objc
    private func resetButtonTapped() {
        timer.stopTimer()
    }
    
    private func addLabel(into stackView: UIStackView, with data: Customer) {
        DispatchQueue.main.async {
            stackView.addArrangedSubview(CustomerInfoView(ticketNumber: data.number, task: data.task.rawValue))
        }
    }
    
    private func eliminateLabel(from stackView: UIStackView, by ticketNumber: UInt) {
        DispatchQueue.main.async {
            stackView.arrangedSubviews.forEach { view in
                guard let customerView = view as? CustomerInfoView,
                      let ticketLabel = customerView.ticketNumber.text,
                      let ticketLabelNumber = UInt(ticketLabel) else { return }
                
                if ticketLabelNumber == ticketNumber {
                    stackView.removeArrangedSubview(view)
                    view.removeFromSuperview()
                    return
                }
            }
        }
    }
    
}


// MARK: - Timer
extension ViewController: TimerDelegate {
    func updateTime() {
        self.timerLabel.text = timer.updateTimerLabel()
    }
}
