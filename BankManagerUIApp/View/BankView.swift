//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by 김수경 on 2023/11/13.
//

import UIKit

final class BankView: UIView {
    lazy var addClientButton: UIButton = {
        let button = UIButton(title: "고객 10명 추가", titleColor: .systemBlue)
        
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton(title: "초기화", titleColor: .systemRed)
        
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, subViews: [addClientButton, resetButton])
        
        return stackView
    }()
    
    lazy var taskTimeLabel: UILabel = {
        let label = UILabel(text: "업무시간 - 00:00:000", font: UIFont(name: "HelveticaNeue", size: 25.0)!, textAlignment: .center)
        
        return label
    }()
    
    private lazy var waitLabel: UILabel = {
        let label = UILabel(text: "대기중", font: .preferredFont(forTextStyle: .largeTitle), textColor: .white, textAlignment: .center)
        label.backgroundColor = .systemGreen
        
        return label
    }()
    
    private lazy var taskLabel: UILabel = {
        let label = UILabel(text: "업무중", font: .preferredFont(forTextStyle: .largeTitle), textColor: .white, textAlignment: .center)
        label.backgroundColor = .systemIndigo
        
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, subViews: [waitLabel, taskLabel])
        
        return stackView
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, spacing: 16, subViews: [buttonStackView, taskTimeLabel, labelStackView])
        addSubview(stackView)
        
        return stackView
    }()
    
    lazy var waitingStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, alignment: .center, spacing: 10)
        
        return stackView
    }()
    
    private lazy var waitingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(waitingStackView)
        
        return scrollView
    }()
    
    lazy var taskingStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, alignment: .center, spacing: 10)
        return stackView
    }()
    
    private lazy var taskingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(taskingStackView)
        
        return scrollView
    }()
    
    private lazy var footerStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, subViews: [waitingScrollView, taskingScrollView])
        
        addSubview(stackView)
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setConstraint() {
        backgroundColor = .white
        
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            waitLabel.widthAnchor.constraint(equalTo: waitingStackView.widthAnchor, multiplier: 1),
            waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.topAnchor),
            waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.leadingAnchor),
            waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.trailingAnchor),
            waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.bottomAnchor),
            
            taskingStackView.widthAnchor.constraint(equalTo: taskLabel.widthAnchor, multiplier: 1),
            taskingStackView.topAnchor.constraint(equalTo: taskingScrollView.topAnchor),
            taskingStackView.leadingAnchor.constraint(equalTo: taskingScrollView.leadingAnchor),
            taskingStackView.trailingAnchor.constraint(equalTo: taskingScrollView.trailingAnchor),
            taskingStackView.bottomAnchor.constraint(equalTo: taskingScrollView.bottomAnchor),
            
            footerStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            footerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            footerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
        ])
    }
}
