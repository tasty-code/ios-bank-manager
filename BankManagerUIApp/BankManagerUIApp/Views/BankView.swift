//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by 김경록 on 11/13/23.
//

import UIKit

final class BankView: UIView {
    let addCustomerButton: UIButton = UIButton(title: "고객 10명 추가", titleColor: .systemBlue)
    let resetButton: UIButton = UIButton(title: "초기화", titleColor: .systemRed)
    
    let workTimeLabel: UILabel = UILabel(text: "업무시간 - 00:00.000", fontSize: 23)
    
    private let waitingListTitle: UILabel = UILabel(text: "대기중", fontSize: 30, textColor: .white, backgroundColor: .systemGreen)
    private let workingListTitle: UILabel = UILabel(text: "업무중", fontSize: 30, textColor: .white, backgroundColor: .systemIndigo)
    
    let waitingListView: ListView = ListView()
    let workingListView: ListView = ListView()
        
    private let waitingListContainer: UIStackView = UIStackView(spacing: 0, axis: .vertical, distribution: .fill, align: .fill)
    private let workingListContainer: UIStackView = UIStackView(spacing: 0, axis: .vertical, distribution: .fill, align: .fill)
    
    private let buttonsContainer: UIStackView = UIStackView(spacing: 0, axis: .horizontal, distribution: .fillEqually, align: .fill)
    private let dashBoardContainer: UIStackView = UIStackView(spacing: 0, axis: .horizontal, distribution: .fillEqually)
    private let rootContainer: UIStackView = UIStackView(spacing: 10, axis: .vertical)
    
    func configureLayout() {
        self.addSubview(rootContainer)
        
        buttonsContainer.addArrangedSubViews(addCustomerButton, resetButton)
        waitingListContainer.addArrangedSubViews(waitingListTitle, waitingListView)
        workingListContainer.addArrangedSubViews(workingListTitle, workingListView)
        dashBoardContainer.addArrangedSubViews(waitingListContainer, workingListContainer)
        rootContainer.addArrangedSubViews(buttonsContainer, workTimeLabel, dashBoardContainer)
        
        buttonsContainer.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        waitingListContainer.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        workingListContainer.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            rootContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            rootContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            rootContainer.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            rootContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
    
    func configureAttribute() {
        self.backgroundColor = .white
        workTimeLabel.font = UIFont(name: "HelveticaNeue", size: 23)
    }

    func configureView() {
        configureAttribute()
        configureLayout()
    }
}


