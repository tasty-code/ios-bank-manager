//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: Namespace
    private enum Constants {
        case addCustomersButton
        case resetButton
        case timerLabel(accumulatedTimes: String)
        case waitingLabel
        case workingLabel
        
        var title: String {
            switch self {
            case .addCustomersButton:
                "고객 10명 추가"
            case .resetButton:
                "초기화"
            case .timerLabel(let accumulatedTimes):
                "업무시간 - \(accumulatedTimes)"
            case .waitingLabel:
                "대기중"
            case .workingLabel:
                "업무중"
            }
        }
        
        static let defaultSpacing: CGFloat = 14
        static let labelsSpacing: CGFloat = 8
        static let customerGatheringQuantityLimit: Int = 10
        static let firstCustomerNumber: Int = 1
        static let initialAccumulatedTimes: String = "00:00:000"
    }
    
    // MARK: Properties
    private let tellers: [TellerProtocol] = [Teller(tellerCount: 2), Teller(tellerCount: 1)]
    private lazy var bank: Bank = Bank(tellers: tellers, self)
    private let timer: TimerProtocol = BankTimer(timeInterval: 0.001)
    private var currentCustomerNumber: Int = 1
    
    // MARK: View Components
    private lazy var headerVerticalStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, spacing: Constants.defaultSpacing)
        return stackView
    }()
    
    private lazy var buttonsHorizontalStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal)
        return stackView
    }()
    
    private lazy var addCustomersButton: UIButton = {
        let button = UIButton(title: Constants.addCustomersButton.title)
        button.addTarget(self, action: #selector(addCustomers), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(title: Constants.resetButton.title, titleColor: .systemRed)
        button.addTarget(self, action: #selector(resetCustomers), for: .touchUpInside)
        return button
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel(text: Constants.timerLabel(accumulatedTimes: Constants.initialAccumulatedTimes).title, font: .monospacedDigitSystemFont(ofSize: 24, weight: .medium))
        return label
    }()
    
    private lazy var bankingStateLabelsHorizontalStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, spacing: .zero)
        return stackView
    }()
    
    private lazy var waitingStateLabel: UILabel = {
        let label = UILabel(text: Constants.waitingLabel.title, font: .preferredFont(forTextStyle: .largeTitle), textColor: .white, backgroundColor: .systemGreen)
        return label
    }()
    
    private lazy var workingStateLabel: UILabel = {
        let label = UILabel(text: Constants.workingLabel.title, font: .preferredFont(forTextStyle: .largeTitle), textColor: .white, backgroundColor: .systemIndigo)
        return label
    }()
    
    private lazy var customerLabelsHorizontalStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, spacing: .zero)
        return stackView
    }()
    
    private lazy var waitingCustomerLabelsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var waitingCustomerLabelsStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, spacing: Constants.labelsSpacing)
        return stackView
    }()
    
    private lazy var workingCustomerLabelsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var workingCustomerLabelsStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, spacing: Constants.labelsSpacing)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayouts()
        setUpConstraints()
    }
}

// MARK: UI Configure Methods
extension ViewController {
    private func setUpLayouts() {
        view.addSubview(headerVerticalStackView)
        view.addSubview(customerLabelsHorizontalStackView)
        
        buttonsHorizontalStackView.addArrangedSubviews([addCustomersButton, resetButton])
        bankingStateLabelsHorizontalStackView.addArrangedSubviews([waitingStateLabel, workingStateLabel])
        
        waitingCustomerLabelsScrollView.addSubview(waitingCustomerLabelsStackView)
        workingCustomerLabelsScrollView.addSubview(workingCustomerLabelsStackView)
        customerLabelsHorizontalStackView.addArrangedSubviews([waitingCustomerLabelsScrollView, workingCustomerLabelsScrollView])
        
        headerVerticalStackView.addArrangedSubviews([buttonsHorizontalStackView, timerLabel, bankingStateLabelsHorizontalStackView])
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerVerticalStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            headerVerticalStackView.bottomAnchor.constraint(equalTo: customerLabelsHorizontalStackView.topAnchor, constant: -Constants.labelsSpacing),
            
            customerLabelsHorizontalStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            customerLabelsHorizontalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            waitingCustomerLabelsScrollView.widthAnchor.constraint(equalTo: customerLabelsHorizontalStackView.widthAnchor, multiplier: 0.5),
            workingCustomerLabelsScrollView.widthAnchor.constraint(equalTo: customerLabelsHorizontalStackView.widthAnchor, multiplier: 0.5),
        ])
        
        NSLayoutConstraint.activate([
            waitingCustomerLabelsStackView.topAnchor.constraint(equalTo: waitingCustomerLabelsScrollView.contentLayoutGuide.topAnchor),
            waitingCustomerLabelsStackView.bottomAnchor.constraint(equalTo: waitingCustomerLabelsScrollView.contentLayoutGuide.bottomAnchor),
            waitingCustomerLabelsStackView.leadingAnchor.constraint(equalTo: waitingCustomerLabelsScrollView.frameLayoutGuide.leadingAnchor),
            waitingCustomerLabelsStackView.trailingAnchor.constraint(equalTo: waitingCustomerLabelsScrollView.frameLayoutGuide.trailingAnchor),
            waitingCustomerLabelsStackView.widthAnchor.constraint(equalTo: waitingCustomerLabelsScrollView.frameLayoutGuide.widthAnchor),
            
            workingCustomerLabelsStackView.topAnchor.constraint(equalTo: workingCustomerLabelsScrollView.contentLayoutGuide.topAnchor),
            workingCustomerLabelsStackView.bottomAnchor.constraint(equalTo: workingCustomerLabelsScrollView.contentLayoutGuide.bottomAnchor),
            workingCustomerLabelsStackView.leadingAnchor.constraint(equalTo: workingCustomerLabelsScrollView.frameLayoutGuide.leadingAnchor),
            workingCustomerLabelsStackView.trailingAnchor.constraint(equalTo: workingCustomerLabelsScrollView.frameLayoutGuide.trailingAnchor),
            workingCustomerLabelsStackView.widthAnchor.constraint(equalTo: workingCustomerLabelsScrollView.frameLayoutGuide.widthAnchor),
        ])
    }
}

// MARK: Private Methods
extension ViewController {
    @objc private func addCustomers() {
        timer.fire { [self] timeText in
            self.timerLabel.text = Constants.timerLabel(accumulatedTimes: timeText).title
        }
        
        gatherCustomers(
            bank: bank,
            from: currentCustomerNumber,
            to: currentCustomerNumber + Constants.customerGatheringQuantityLimit - Constants.firstCustomerNumber
        )
        
        bank.work { [self] isQueueEmpty in
            guard isQueueEmpty else { return }
            timer.pause()
        }
    }
    
    @objc private func resetCustomers() {
        timer.reset { [self] timeText in
            self.timerLabel.text = Constants.timerLabel(accumulatedTimes: Constants.initialAccumulatedTimes).title
        }
        
        waitingCustomerLabelsStackView.removeArrangedSubviews(waitingCustomerLabelsStackView.arrangedSubviews)
        workingCustomerLabelsStackView.removeArrangedSubviews(workingCustomerLabelsStackView.arrangedSubviews)
        
        currentCustomerNumber = Constants.firstCustomerNumber
    }
    
    private func createCustomerLabel(customer: Customer, in customerStackView: UIStackView) {
        let customerLabel = CustomerLabel(customer)
        customerStackView.addArrangedSubview(customerLabel)
    }
    
    private func removeCustomerLabel(customer: Customer, in customerStackView: UIStackView) {
        let arrangedSubviews = customerStackView.arrangedSubviews
        let customerLabels = arrangedSubviews.map { $0 as? CustomerLabel }
        
        guard let customerLabel = customerLabels.first (where: {$0?.customer.id == customer.id}) else { return }
        
        if let customerLabel = customerLabel {
            customerStackView.removeArrangedSubview(customerLabel)
            customerLabel.removeFromSuperview()
        }
    }
}

// MARK: Bank Delegation Methods
extension ViewController: BankDelegate {
    func gatherCustomers(bank: Bank, from startCount: Int, to endCount: Int) {
        bank.gatherCustomers(from: startCount, to: endCount)
        
        currentCustomerNumber = endCount + 1
    }
    
    func updateWaitingCustomersList(bank: Bank, customer: Customer) {
        createCustomerLabel(customer: customer, in: waitingCustomerLabelsStackView)
    }
    
    func updateWorkingCustomersList(bank: Bank, customer: Customer) {
        removeCustomerLabel(customer: customer, in: workingCustomerLabelsStackView)
    }
    
    func updateViewWhenCustomerDidMatched(bank: Bank, customer: Customer) {
        removeCustomerLabel(customer: customer, in: waitingCustomerLabelsStackView)
        createCustomerLabel(customer: customer, in: workingCustomerLabelsStackView)
    }
}
