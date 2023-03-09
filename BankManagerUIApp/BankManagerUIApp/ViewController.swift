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
    
    private let buttonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5

        return stackView
    }()
    
    //MARK: - Properties: TimerLabels & Stack
    
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.text = BankTextCollection.task
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
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
    
    private let progressStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        
        return stackView
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButtonStack()
        setTimerLabelStackView()
        setProgressStackView()
    }
    
    //MARK: - UI Setting
    
    private func setUI() {
        view.addSubview(buttonStackView)
        view.addSubview(timerLabelStackView)
        view.addSubview(progressStackView)
    }
    
    private func setButtonStack() {
        buttonStackView.addArrangedSubview(addCustomersButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        buttonStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        buttonStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    }
    
    private func setTimerLabelStackView() {
        timerLabelStackView.addArrangedSubview(taskLabel)
        timerLabelStackView.addArrangedSubview(timerLabel)
        
        timerLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        timerLabelStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor,constant: 10).isActive = true
        timerLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    private func setProgressStackView() {
        progressStackView.addArrangedSubview(standbyLabel)
        progressStackView.addArrangedSubview(inprogressLabel)
        
        progressStackView.translatesAutoresizingMaskIntoConstraints = false
        progressStackView.topAnchor.constraint(equalTo: timerLabelStackView.bottomAnchor,constant: 15).isActive = true
        progressStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        progressStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        progressStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
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

