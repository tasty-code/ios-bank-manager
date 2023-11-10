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
        static let defaultHeaderStackViewHeight: CGFloat = 150
    }
    
    // MARK: Properties
    private let tellers: [TellerProtocol] = [Teller(tellerCount: 2), Teller(tellerCount: 1)]
    private lazy var bank: Bank = Bank(tellers: tellers)
    
    // MARK: View Components
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.defaultSpacing
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Constants.defaultSpacing
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.defaultSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var verticalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var customersLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.defaultSpacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var waitingCustomersLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.defaultSpacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var workingCustomersLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.defaultSpacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var addCustomersButton: UIButton = {
        let button = UIButton()
        button.role = .normal
        button.setTitle(Constants.addCustomersButton.title, for: .normal)
        button.addTarget(self, action: #selector(addCustomers), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.role = .destructive
        button.setTitle(Constants.resetButton.title, for: .normal)
        button.addTarget(self, action: #selector(resetCustomers), for: .touchUpInside)
        return button
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "04:33:253"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textColor = .white
        return label
    }()
    
    private lazy var waitingHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.waitingLabel.title
        label.backgroundColor = .green
        label.textColor = .white
        return label
    }()
    
    private lazy var workingHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.workingLabel.title
        label.backgroundColor = UIColor(red: 102, green: 91, blue: 219, alpha: 1)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
    }
}

// MARK: UI Configure Methods
extension ViewController {
    private func setUpConstraints() {
        contentStackView.addArrangedSubviews([buttonsStackView, timerLabel, headerStackView, customersLabelStackView])
        buttonsStackView.addArrangedSubviews([addCustomersButton, resetButton])
        headerStackView.addArrangedSubviews([waitingHeaderLabel, workingHeaderLabel])
        customersLabelStackView.addArrangedSubviews([waitingCustomersLabelStackView, workingCustomersLabelStackView])
        
        
    }
}

// MARK: Private Methods
extension ViewController {
    @objc private func addCustomers() {
        
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

struct Previewer: PreviewProvider {
    static var previews: some View {
        Preview {
            let viewController = ViewController()
            return viewController.view
        }
    }
}
#endif
