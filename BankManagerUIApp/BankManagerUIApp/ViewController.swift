//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties: Button
    
    private let addCustomersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(ViewController.self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(ViewController.self, action: #selector(resetButtonTapped), for: .touchUpInside)
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
        label.text = "업무시간 -"
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
        label.text = "대기중"
        label.textColor = .white
        label.backgroundColor = UIColor(red: 80/255, green: 200/255, blue: 85/255, alpha: 1.0)
        label.textAlignment = .center
        
        return label
    }()
    
    private let inprogressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35)
        label.text = "업무중"
        label.textColor = .white
        label.backgroundColor = UIColor(red: 110/255, green: 100/255, blue: 240/255, alpha: 1.0)
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
        view.addSubview(addCustomersButton)
        view.addSubview(resetButton)
        view.addSubview(buttonStackView)
        
        view.addSubview(timerLabel)
        view.addSubview(taskLabel)
        view.addSubview(timerLabelStackView)
        
        view.addSubview(standbyLabel)
        view.addSubview(inprogressLabel)
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

