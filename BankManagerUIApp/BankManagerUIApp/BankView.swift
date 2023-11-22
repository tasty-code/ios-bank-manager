import UIKit

final class BankView: UIView {
    let addCustomerButton: UIButton = {
        let button = UIButton(title: "고객 10명 추가", titleColor: .systemBlue, backgroundColor: .clear)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(title: "초기화", titleColor: .systemRed, backgroundColor: .clear)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 10, arrangedSubviews: [addCustomerButton, resetButton])
        return stackView
    }()
    
    private let workingTimeLabel: UILabel = {
        let label = UILabel(text: "업무시간 - 00:00:000", textColor: .black, backgroundColor: .clear)
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        return label
    }()
    
    private let waitingLabel: UILabel = {
        let label = UILabel(text: "대기중", fontSize: 30, textColor: .white, backgroundColor: .systemGreen)
        return label
    }()
    
    private let workingLabel: UILabel = {
        let label = UILabel(text: "업무중", fontSize: 30, textColor: .white, backgroundColor: .systemIndigo)
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 0, arrangedSubviews: [waitingLabel, workingLabel])
        return stackView
    }()
    
    private lazy var upperStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually, alignment: .fill, spacing: 20, arrangedSubviews: [buttonStackView, workingTimeLabel, labelStackView])
        return stackView
    }()
    
    private let waitingStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually)
        return stackView
    }()
    
    private lazy var waitingScrollView: UIScrollView = {
        let scrollView = UIScrollView(subView: waitingStackView)
        return scrollView
    }()
    
    private let workingStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually)
        return stackView
    }()
    
    private lazy var workingScrollView: UIScrollView = {
        let scrollView = UIScrollView(subView: workingStackView, isScrollEnabled: false)
        return scrollView
    }()
    
    private lazy var lowerStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, spacing: 0, arrangedSubviews: [waitingScrollView, workingScrollView])
        return stackView
    }()
    
    private lazy var bankView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fill, arrangedSubviews: [upperStackView, lowerStackView])
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUI() {
        self.backgroundColor = .white
        self.addSubview(bankView)
    }
    
    private func setConstraint() {
        setContentStackViewConstraint()
        setWaitingStackViewConstraint()
        setWorkingStackViewConstraint()
    }
    
    private func setContentStackViewConstraint() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            bankView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            bankView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            bankView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            bankView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func setWaitingStackViewConstraint() {
        NSLayoutConstraint.activate([
            waitingStackView.leadingAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.leadingAnchor),
            waitingStackView.trailingAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.trailingAnchor),
            waitingStackView.topAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.topAnchor),
            waitingStackView.bottomAnchor.constraint(equalTo: waitingScrollView.contentLayoutGuide.bottomAnchor),
            waitingStackView.widthAnchor.constraint(equalTo: waitingScrollView.frameLayoutGuide.widthAnchor)
        ])
    }
    
    private func setWorkingStackViewConstraint() {
        NSLayoutConstraint.activate([
            workingStackView.leadingAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.leadingAnchor),
            workingStackView.trailingAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.trailingAnchor),
            workingStackView.topAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.topAnchor),
            workingStackView.bottomAnchor.constraint(equalTo: workingScrollView.contentLayoutGuide.bottomAnchor),
            workingStackView.widthAnchor.constraint(equalTo: workingScrollView.frameLayoutGuide.widthAnchor)
        ])
    }
    
    func updateTimer(_ minutes: Int, _ seconds: Int, _ milliseconds: Int) {
        workingTimeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds, milliseconds)
    }
    
    func addWaitingStackView(_ customer: Customer) {
        let label = UILabel(text: "\(customer.orderNumber) - \(customer.task.name)", fontSize: 20)

        if customer.task.name == LoanTask.name {
            label.textColor = .systemPurple
        }
        waitingStackView.addArrangedSubview(label)
    }
    
    func addWorkingStackView(_ customer: Customer) {
        let label = UILabel(text: "\(customer.orderNumber) - \(customer.task.name)", fontSize: 20)

        if customer.task.name == LoanTask.name {
            label.textColor = .systemPurple
        }
        workingStackView.addArrangedSubview(label)
    }
    
    func deleteWaitingStackView(_ customer: Customer) {
        waitingStackView.arrangedSubviews.forEach { subview in
            guard let label = subview as? UILabel, let text = label.text else {
                return
            }
            
            guard let trimmedText = text.split(separator: " ").first else {
                return
            }
            
            if trimmedText == "\(customer.orderNumber)" {
                label.removeFromSuperview()
                return
            }
        }
    }
    
    func deleteWorkingStackView(_ customer: Customer) {
        workingStackView.arrangedSubviews.forEach { subview in
            guard let label = subview as? UILabel, let text = label.text else {
                return
            }
            
            guard let trimmedText = text.split(separator: " ").first else {
                return
            }
            
            if trimmedText == "\(customer.orderNumber)" {
                label.removeFromSuperview()
                return
            }
        }
    }
    
    func resetWorkingTimeLabel() {
        workingTimeLabel.text = "업무시간 - 00:00:000"
    }
    
    func resetCustomer() {
        waitingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        workingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func checkInvalidate(completion: () -> Void) {
        if waitingStackView.arrangedSubviews.isEmpty && workingStackView.arrangedSubviews.isEmpty {
            completion()
        }
    }
}
