//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by 최승범 on 2023/11/16.
//

import UIKit

final class BankView: UIView {
    
    private lazy var mainStackView: UIStackView = configureVerticalStackView()
    
    private lazy var buttonStackView: UIStackView = configureHorizontalStackView()
    lazy var addCustomerButton: UIButton = configureButton(title: "고객 10명 추가", color: .blue)
    lazy var resetButton: UIButton = configureButton(title: "초기화", color: .red)
       
    lazy var timerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "00 : 00 : 000"
        label.textAlignment = .center
        label.font = UIFont.monospacedSystemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private lazy var titleStackView: UIStackView = configureHorizontalStackView()
    private lazy var readyTitleLabel: UILabel = configureTitleLabel(text: "대기중", backgroundColor: .systemGreen)
    private lazy var runningTitleLabel: UILabel = configureTitleLabel(text: "업무중", backgroundColor: .systemBlue)
    
    private lazy var listStackView: UIStackView = {
        let view = configureHorizontalStackView()
        view.alignment = .fill
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
    
    lazy var readyListStackView: UIStackView = configureVerticalStackView()
    
    lazy var runningListStackView: UIStackView = configureVerticalStackView()
    
    func configureVerticalStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }
    
    func configureHorizontalStackView() -> UIStackView {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }
    
    func configureTitleLabel(text: String, backgroundColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.backgroundColor = backgroundColor
        label.textColor = .white
        label.font = .systemFont(ofSize: 40)
        return label
    }
    
    func configureButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        return button
    }
    
    func configureTaskLabel(type: TypeOfWork, number: Int, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = "\(number) - \(type.name)"
        label.textAlignment = .center
        label.textColor = textColor
        label.font = .systemFont(ofSize: 24)
        label.tag = number
        return label
    }
    
    
    func configure() {
        self.addSubview(mainStackView)
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
        let safeArea = self
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
}

