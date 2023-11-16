import UIKit

final class ContentView: UIView {
    lazy var addCustomerButton: UIButton = {
        let button = UIButton(title: "고객 10명 추가", titleColor: .systemBlue, backgroundColor: .clear)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton(title: "초기화", titleColor: .systemRed, backgroundColor: .clear)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 10, arrangedSubviews: [addCustomerButton, resetButton])
        return stackView
    }()
    
    lazy var workingTimeLabel: UILabel = {
        let label = UILabel(text: "업무시간 - 00:00:000", textColor: .black, backgroundColor: .clear)
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        return label
    }()
    
    lazy var waitingLabel: UILabel = {
        let label = UILabel(text: "대기중", fontSize: 30, textColor: .white, backgroundColor: .systemGreen)
        return label
    }()
    
    lazy var workingLabel: UILabel = {
        let label = UILabel(text: "업무중", fontSize: 30, textColor: .white, backgroundColor: .systemIndigo)
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 0, arrangedSubviews: [waitingLabel, workingLabel])
        return stackView
    }()
    
    lazy var upperStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually, alignment: .fill, spacing: 20, arrangedSubviews: [buttonStackView, workingTimeLabel, labelStackView])
        return stackView
    }()
    
    lazy var waitingStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually)
        return stackView
    }()
    
    lazy var waitingScrollView: UIScrollView = {
        let scrollView = UIScrollView(subView: waitingStackView)
        return scrollView
    }()
    
    lazy var workingStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually)
        return stackView
    }()
    
    lazy var workingScrollView: UIScrollView = {
        let scrollView = UIScrollView(subView: workingStackView, isScrollEnabled: false)
        return scrollView
    }()
    
    lazy var lowerStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, spacing: 0, arrangedSubviews: [waitingScrollView, workingScrollView])
        return stackView
    }()
    
    lazy var contentView: UIStackView = {
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
        self.addSubview(contentView)
    }
    
    private func setConstraint() {
        setContentStackViewConstraint()
        setWaitingStackViewConstraint()
    }
    
    private func setContentStackViewConstraint() {
        let safeArea = self.safeAreaLayoutGuide
        self.backgroundColor = .white
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
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
    
    func updateTime(_ minutes: Int, _ seconds: Int, _ milliseconds: Int) {
        workingTimeLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        workingTimeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds, milliseconds)
    }
    
    func resetCustomer() {
        waitingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        workingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func resetWorkingTimeLabel() {
        workingTimeLabel.text = "업무시간 - 00:00:000"
    }
    
    func addCustomer(_ orderNumber: Int, and taskName: String) {
        let label = UILabel(text: "\(orderNumber) - \(taskName)", fontSize: 20, tag: orderNumber)

        if taskName == LoanTask.name {
            label.textColor = .systemPurple
        }
        
        waitingStackView.addArrangedSubview(label)
    }
    
    func deleteWaitingStackView(_ orderNumber: Int) {
        waitingStackView.arrangedSubviews.forEach { subview in
            guard let label = subview as? UILabel, let text = label.text else {
                return
            }
        
            guard let trimmedText = text.split(separator: " ").first else {
                return
            }
            
            if trimmedText == "\(orderNumber)" {
                label.removeFromSuperview()
                return
            }
        }
    }
    
}
