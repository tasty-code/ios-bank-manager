//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by 김경록 on 11/13/23.
//

import UIKit

class BankView: UIView {
//    button.titleLabel?.textAlignment = .center
    private let addCustomerButton: UIButton = UIButton(title: "고객 10명 추가", titleColor: .systemBlue)
    private let resetButton: UIButton = UIButton(title: "초기화", titleColor: .systemRed)
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addCustomerButton,resetButton])
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        
        return stackView
    }()
    
    let workTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - 00:00:00"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "HelveticaNeue", size: 23)
        
        return label
    }()
    
    private let waitingListLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.font = label.font.withSize(30)
        
        return label
    }()
    
    private lazy var waitingListView: UIView = {
        let view = UIView()
        view.addSubview(waitingListScrollView)
        
        return view
    }()
    
    let waitingListStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var waitingListScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(waitingListStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var waitingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [waitingListLabel,waitingListView])
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        
        return stackView
    }()
    
    private let workingListLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.font = label.font.withSize(30)
        
        return label
    }()
    private lazy var workingListView: UIView = {
        let view = UIView()
        view.addSubview(workingListScrollView)
        
        return view
    }()
    
    let workingListStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var workingListScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(workingListStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var workingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [workingListLabel,workingListView])
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        
        return stackView
    }()
    
    private lazy var dashBoardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [waitingStackView,workingStackView])
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonStackView,workTimeLabel,dashBoardStackView])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    func configureUI() {
        self.backgroundColor = .white
        self.addSubview(rootStackView)
        
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //전체 뷰
            rootStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            rootStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            rootStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            rootStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            //왼쪽 스크롤뷰
            waitingListStackView.leadingAnchor.constraint(equalTo: waitingListScrollView.leadingAnchor, constant: 0),
            waitingListStackView.widthAnchor.constraint(equalTo: waitingListScrollView.widthAnchor, constant: 0),
            waitingListStackView.topAnchor.constraint(equalTo: waitingListScrollView.topAnchor, constant: 0),
            waitingListStackView.bottomAnchor.constraint(equalTo: waitingListScrollView.bottomAnchor, constant: 0),
            
            waitingListScrollView.topAnchor.constraint(equalTo: waitingListView.topAnchor, constant: 0),
            waitingListScrollView.bottomAnchor.constraint(equalTo: waitingListView.bottomAnchor, constant: 0),
            waitingListScrollView.trailingAnchor.constraint(equalTo: waitingListView.trailingAnchor, constant: 0),
            waitingListScrollView.leadingAnchor.constraint(equalTo: waitingListView.leadingAnchor, constant: 0),
            
            //오른쪽 스크롤뷰
            workingListStackView.leadingAnchor.constraint(equalTo: workingListScrollView.leadingAnchor, constant: 0),
            workingListStackView.widthAnchor.constraint(equalTo: workingListScrollView.widthAnchor, constant: 0),
            workingListStackView.topAnchor.constraint(equalTo: workingListScrollView.topAnchor, constant: 0),
            workingListStackView.bottomAnchor.constraint(equalTo: workingListScrollView.bottomAnchor, constant: 0),
            
            workingListScrollView.topAnchor.constraint(equalTo: workingListView.topAnchor, constant: 0),
            workingListScrollView.bottomAnchor.constraint(equalTo: workingListView.bottomAnchor, constant: 0),
            workingListScrollView.trailingAnchor.constraint(equalTo: workingListView.trailingAnchor, constant: 0),
            workingListScrollView.leadingAnchor.constraint(equalTo: workingListView.leadingAnchor, constant: 0),
        ])
    }
}


