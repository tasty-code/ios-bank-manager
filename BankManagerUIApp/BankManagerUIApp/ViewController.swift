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
        case timerLabel(accumulatedTimes: TimeInterval)
        case waitingLabel
        case workingLabel
        case customerLabel(customer: Customer)
        
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
            case .customerLabel(let customer):
                "\(customer.id) - \(customer.workType)"
            }
        }
        
        static let defaultSpacing: CGFloat = 14
        static let labelsSpacing: CGFloat = 8
    }
    
    // MARK: Properties
    private let tellers: [TellerProtocol] = [Teller(tellerCount: 2), Teller(tellerCount: 1)]
    private lazy var bank: Bank = Bank(tellers: tellers)
    
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
        let label = UILabel(text: "업무시간 - 04:33:253", font: .preferredFont(forTextStyle: .title1))
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
        return scrollView
    }()
    
    private lazy var waitingCustomerLabelsStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, spacing: Constants.labelsSpacing)
        stackView.backgroundColor = .blue
        return stackView
    }()
    
    private lazy var workingCustomerLabelsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
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
            headerVerticalStackView.bottomAnchor.constraint(equalTo: customerLabelsHorizontalStackView.topAnchor),
            customerLabelsHorizontalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
        ])
        
        NSLayoutConstraint.activate([
            
        ])
    }
}

// MARK: Private Methods
extension ViewController {
    @objc private func addCustomers() {
        let label1 = UILabel(text: "고객", font: .preferredFont(forTextStyle: .body))
        waitingCustomerLabelsStackView.addArrangedSubview(label1)
    }
    
    @objc private func resetCustomers() {
        
    }
}

// MARK: PreviewProvider
#if canImport(SwiftUI)
import SwiftUI

struct Preview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ interfaceBuilder: @escaping () -> View) {
        view = interfaceBuilder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

//struct Previewer: PreviewProvider {
//    static var previews: some View {
//        Preview {
//            let viewController = ViewController()
//            return viewController.view
//        }
//    }
//}
#endif
