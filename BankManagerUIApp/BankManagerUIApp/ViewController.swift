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
    }
    
    // MARK: Properties
    private let tellers: [TellerProtocol] = [Teller(tellerCount: 2), Teller(tellerCount: 1)]
    private lazy var bank: Bank = Bank(tellers: tellers)
    
    // MARK: View Components
    private lazy var contentVerticalStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, spacing: Constants.defaultSpacing)
        return stackView
    }()
    
    private lazy var buttonsHorizontalStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal)
        return stackView
    }()
    
    private lazy var addCustomersButton: UIButton = {
        let button = UIButton(title: Constants.addCustomersButton.title)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(title: Constants.resetButton.title, titleColor: .systemRed)
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
        view.addSubview(contentVerticalStackView)
        buttonsHorizontalStackView.addArrangedSubviews([addCustomersButton, resetButton])
        bankingStateLabelsHorizontalStackView.addArrangedSubviews([waitingStateLabel, workingStateLabel])
        contentVerticalStackView.addArrangedSubviews([buttonsHorizontalStackView, timerLabel, bankingStateLabelsHorizontalStackView])
        
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
//            contentVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            contentVerticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            contentVerticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            contentVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

            contentVerticalStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            contentVerticalStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
            
        ])
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
