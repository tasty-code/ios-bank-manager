//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties: Button
    
    private lazy var addCustomersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let buttonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0

        return stackView
    }()
    
    //MARK: - Properties: TimerLabels & Stack
    
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 -"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "00:00:000"
        return label
    }()
    
    private let timerLabelStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0

        return stackView
    }()

    //MARK: - Properties: StateLabels & Stack
    
    private let standbyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35)
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = .designSystem(.mainGreen)
        label.textAlignment = .center
        
        return label
    }()
    
    private let inprogressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35)
        label.text = "업무중"
        label.textColor = .white
        label.backgroundColor = .designSystem(.mainPurple)
        label.textAlignment = .center
        
        return label
    }()
    
    private let progressStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        
        return stackView
    }()
    
    //MARK: - Properties: Interface Stack
    
    private let interfaceStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        
        return stackView
    }()
    
    //MARK: - Properties: CustomerWaiting&Inprogress Stack
    private let waitingInprogressStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        
        return stackView
    }()
    
    
    private let waitingStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        
        return stackView
    }()
    
    private let inprogressStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        
        return stackView
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

    }
    
    //MARK: - UI Setting
    
    private func setUI() {
        view.addSubview(interfaceStackView)
        view.addSubview(waitingInprogressStackView)
        
        setButtonStack()
        setTimerLabelStackView()
        setProgressStackView()
        setInterfaceStackView()
        setCustomerWaitingStack()
        setCustomerInprogressStack()
        setWaitingAndInprogressStack()
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
        interfaceStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        interfaceStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        interfaceStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    }
    
    private func setCustomerWaitingStack() {
        let customer: CustomerInfoView = {
            let label = CustomerInfoView(frame: .zero)
            label.taskTypeLabel.font = UIFont.systemFont(ofSize: 30)
            
            return label
        }()
        waitingStackView.addArrangedSubview(customer)
    }
    
    private func setCustomerInprogressStack() {
        let customer: CustomerInfoView = {
            let label = CustomerInfoView(frame: .zero)
            label.taskTypeLabel.font = UIFont.systemFont(ofSize: 30)
            
            return label
        }()
        waitingStackView.addArrangedSubview(customer)
    }
    
    private func setWaitingAndInprogressStack() {
        waitingInprogressStackView.addArrangedSubview(waitingStackView)
        waitingInprogressStackView.addArrangedSubview(inprogressStackView)
        
        waitingInprogressStackView.translatesAutoresizingMaskIntoConstraints = false
        waitingInprogressStackView.topAnchor.constraint(equalTo: interfaceStackView.topAnchor, constant: 0).isActive = true
        waitingInprogressStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        waitingInprogressStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    }
    
    //MARK: - UI Action
    
    @objc
    private func addCustomerButtonTapped() {
        print(#function)
    }
    
    @objc
    private func resetButtonTapped() {
        print(#function)
    }
    
    
}

