//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 


import UIKit

final class ViewController: UIViewController, Delegate {
    private var timer: Timer = Timer()
    private var time: Double = 0
    private var count = 0
    
    private let bankManager = BankManager(depositTellerCount: 2, loanTellerCount: 1)
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var addCustomerButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(reset), for: .touchUpInside)
        return button
    }()
    
    private lazy var timerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "00 : 00 : 00"
        label.textAlignment = .center
        label.font = UIFont.monospacedSystemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var readyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        label.textColor = .white
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    private lazy var runningTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        label.textColor = .white
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    private lazy var listStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var readyListView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var runningListView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var readyListScrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = false
        return view
    }()
    
    private lazy var runningListScrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = false
        return view
    }()
    
    private lazy var readyListStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    private lazy var runningListStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankManager.del = self
        bankManager.depositTellers.del = self
        bankManager.loanTellers.del = self
        view.backgroundColor = .white
        configure()
        setupAutoLayout()
        bankManager.startTime = Date()
        
        
    }
    
    
    func configure() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(timerTitleLabel)
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(listStackView)
        
        buttonStackView.addArrangedSubview(addCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        titleStackView.addArrangedSubview(readyTitleLabel)
        titleStackView.addArrangedSubview(runningTitleLabel)
        
        listStackView.addArrangedSubview(readyListView)
        listStackView.addArrangedSubview(runningListView)
        
        readyListView.addSubview(readyListScrollView)
        runningListView.addSubview(runningListScrollView)
        
        readyListScrollView.addSubview(readyListStackView)
        runningListScrollView.addSubview(runningListStackView)
    }
    
    func setupAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        readyListScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        readyListScrollView.topAnchor.constraint(equalTo: readyListView.topAnchor).isActive = true
        readyListScrollView.bottomAnchor.constraint(equalTo: readyListView.bottomAnchor).isActive = true
        readyListScrollView.leadingAnchor.constraint(equalTo: readyListView.leadingAnchor).isActive = true
        readyListScrollView.trailingAnchor.constraint(equalTo: readyListView.trailingAnchor).isActive = true
        
        runningListScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        runningListScrollView.topAnchor.constraint(equalTo: runningListView.topAnchor).isActive = true
        runningListScrollView.bottomAnchor.constraint(equalTo: runningListView.bottomAnchor).isActive = true
        runningListScrollView.leadingAnchor.constraint(equalTo: runningListView.leadingAnchor).isActive = true
        runningListScrollView.trailingAnchor.constraint(equalTo: runningListView.trailingAnchor).isActive = true
        
        readyListStackView.translatesAutoresizingMaskIntoConstraints = false
        
        readyListStackView.topAnchor.constraint(equalTo: readyListScrollView.topAnchor).isActive = true
        readyListStackView.bottomAnchor.constraint(equalTo: readyListScrollView.bottomAnchor).isActive = true
        readyListStackView.leadingAnchor.constraint(equalTo: readyListScrollView.leadingAnchor).isActive = true
        readyListStackView.trailingAnchor.constraint(equalTo: readyListScrollView.trailingAnchor).isActive = true
        readyListStackView.widthAnchor.constraint(equalTo: readyListScrollView.widthAnchor).isActive = true
        
        runningListStackView.translatesAutoresizingMaskIntoConstraints = false
        
        runningListStackView.topAnchor.constraint(equalTo: runningListScrollView.topAnchor).isActive = true
        runningListStackView.bottomAnchor.constraint(equalTo: runningListScrollView.bottomAnchor).isActive = true
        runningListStackView.leadingAnchor.constraint(equalTo: runningListScrollView.leadingAnchor).isActive = true
        runningListStackView.trailingAnchor.constraint(equalTo: runningListScrollView.trailingAnchor).isActive = true
        runningListStackView.widthAnchor.constraint(equalTo: runningListScrollView.widthAnchor).isActive = true
        
    }
    
    @objc func addCustomer() {
        
        bankManager.createCustomerQueue(customerCount: 10)
        bankManager.total += 10
        if count == 0 {
            startTimer()
            bankManager.uiStartTask()
            count = 1
        }
        
    }
    
    func startTimer() {
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(setTimerLabel), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: .common)
        }
    }
    
    @objc func setTimerLabel() {
        let minute = String(format: "%02d", Int(time) / 60)
        let second = String(format: "%02d", Int(time) % 60)
        let millisecond = String(format: "%03d" , Int(time * 1000) % 1000)
        
        time += 0.001
    
        timerTitleLabel.text = "\(minute) : \(second) : \(millisecond)"
    }
    
    
    
    @objc func reset() {
        
        let _ = readyListStackView.arrangedSubviews.map { $0.removeFromSuperview()}
        let _ = runningListStackView.arrangedSubviews.map { $0.removeFromSuperview()}
        bankManager.depositCustomerQueue.clear()
        bankManager.loanCustomerQueue.clear()
        bankManager.total = 0
        count = 0
        timerStop()
        time = 0
        timerTitleLabel.text = "00 : 00 : 00"
//        addCustomerButton.isEnabled = false
//        addCustomerButton.setTitleColor(.gray, for: .normal)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) { [self] in
//            addCustomerButton.isEnabled = true
//            addCustomerButton.setTitleColor(.blue, for: .normal)
//        }
    }
    
    func timerStop() {
        
        timer.invalidate()
    }
    
    func changeToLabelState(tellerType: TypeOfWork,data: Int){
        
        let time = tellerType.time
        
        
        DispatchQueue.main.sync  { [self] in
            for i in readyListStackView.arrangedSubviews {
                if i.tag == data {
                    readyListStackView.removeArrangedSubview(i)
                    runningListStackView.addArrangedSubview(i)
                    break
                }
            }
            
        }
//        usleep(time)
        
        
    }
    
    func removeLabel(data: Int) {
        DispatchQueue.main.sync  { [self] in
            
            for i in runningListStackView.arrangedSubviews {
                if i.tag == data {
                    i.removeFromSuperview()
                    break
                }
            }
            if runningListStackView.arrangedSubviews.isEmpty && readyListStackView.arrangedSubviews.isEmpty {
                timerStop()
            }
        }
    }
    
    
    
    
    func setupDepositLabel(number: Int){
        DispatchQueue.main.async { [self] in
            let label = UILabel()
            label.text = String(number) + " - 예금"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 24)
            label.tag = number
            readyListStackView.addArrangedSubview(label)
        }
    }
    
    func setupLoanLabel(number: Int){
        DispatchQueue.main.async { [self] in
            let label = UILabel()
            
            label.text = String(number) + " - 대출"
            label.textAlignment = .center
            label.textColor = .orange
            label.font = .systemFont(ofSize: 24)
            label.tag = number
            readyListStackView.addArrangedSubview(label)
        }
    }
    
    func countReset() {
        count = 0
    }
    
    
    
    
}

