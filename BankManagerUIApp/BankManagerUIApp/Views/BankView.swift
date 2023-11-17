//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by 김경록 on 11/13/23.
//

import UIKit

final class BankView: UIView {
    // MARK: - 상단 Buttons and Label
    let addCustomerButton: UIButton = UIButton(title: UIText.addCustomerButton, titleColor: .systemBlue)
    let resetButton: UIButton = UIButton(title: UIText.resetButton, titleColor: .systemRed)
    let workTimeTextLabel: UILabel = UILabel(text: UIText.workTimeLabel(time: 0).displayText, fontSize: 23)
    
    // MARK: - 대기중 Section
    private let waitingStationTitle: UILabel = UILabel(text: UIText.waitingStationTitleLabel, fontSize: 30, textColor: .white, backgroundColor: .systemGreen)
    private let waitingStationView: ListView = ListView()
    private let waitingStationSectionContainer: UIStackView = UIStackView(spacing: 0, axis: .vertical, distribution: .fill, align: .fill)
    
    // MARK: - 업무중 Section
    private let workingStationTitle: UILabel = UILabel(text: UIText.workingStationTitleLabel, fontSize: 30, textColor: .white, backgroundColor: .systemIndigo)
    private let workStationView: ListView = ListView()
    private let workingStationSectionContainer: UIStackView = UIStackView(spacing: 0, axis: .vertical, distribution: .fill, align: .fill)
    
    // MARK: - Layout Containers
    private let buttonsContainer: UIStackView = UIStackView(spacing: 0, axis: .horizontal, distribution: .fillEqually, align: .fill)
    private let dashBoardContainer: UIStackView = UIStackView(spacing: 0, axis: .horizontal, distribution: .fillEqually)
    private let rootContainer: UIStackView = UIStackView(spacing: 10, axis: .vertical)
}

// MARK: - public

extension BankView {
    func configureView() {
        configureAttribute()
        configureLayout()
    }
    
    func addLabelToWaitingStation(_ label: UILabel) {
        waitingStationView.addItemToList(label)
    }
    
    func moveLabelToWorkStation(_ target: String) {
        guard let targetLabel = waitingStationView.filterLabelItem(target) else { return }
        waitingStationView.removeItem(targetLabel)
        workStationView.addItemToList(targetLabel)
    }
    
    func removeLabelFromWorkStation(_ target: String) {
        guard let targetLabel = workStationView.filterLabelItem(target) else { return }
        workStationView.removeItem(targetLabel)
    }
    
    func resetAllStation() {
        waitingStationView.resetAllItem()
        workStationView.resetAllItem()
    }
    
    func updateWorkTime(_ workTime: Double) {
        workTimeTextLabel.text = UIText.workTimeLabel(time: workTime).displayText
    }
    
    func checkAllStationsEmpty() -> Bool {
        return waitingStationView.isListEmpty() && workStationView.isListEmpty()
    }
}


private extension BankView {
    func configureLayout() {
        self.addSubview(rootContainer)
        
        buttonsContainer.addArrangedSubViews(addCustomerButton, resetButton)
        waitingStationSectionContainer.addArrangedSubViews(waitingStationTitle, waitingStationView)
        workingStationSectionContainer.addArrangedSubViews(workingStationTitle, workStationView)
        dashBoardContainer.addArrangedSubViews(waitingStationSectionContainer, workingStationSectionContainer)
        rootContainer.addArrangedSubViews(buttonsContainer, workTimeTextLabel, dashBoardContainer)
        
        buttonsContainer.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        waitingStationSectionContainer.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        workingStationSectionContainer.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            rootContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            rootContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            rootContainer.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            rootContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
    
    func configureAttribute() {
        self.backgroundColor = .white
        workTimeTextLabel.font = UIFont(name: "HelveticaNeue", size: 23)
    }
    
}

