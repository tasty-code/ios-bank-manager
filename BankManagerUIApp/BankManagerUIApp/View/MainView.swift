
import UIKit

class MainView: UIView {
    private let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        return buttonStackView
    }()
    private let addCustomerButton: UIButton = {
        let addCustomerButton = UIButton()
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        addCustomerButton.setTitleColor(.systemBlue, for: .normal)
        addCustomerButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        addCustomerButton.addTarget(nil, action: #selector(ViewController.addCustomerButtonTapped), for: .touchUpInside)
        return addCustomerButton
    }()
    private let resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        resetButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        return resetButton
    }()
    
    private let timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.font = .preferredFont(forTextStyle: .title1)
        timerLabel.text = "test"
        timerLabel.textAlignment = .center
        return timerLabel
    }()
    
    private let queueStackView: UIStackView = {
        let queueStackView = UIStackView()
        queueStackView.axis = .horizontal
        queueStackView.distribution = .fillEqually
        return queueStackView
    }()
    private let waitingStackView: UIStackView = {
        let waitingStackView = UIStackView()
        waitingStackView.axis = .vertical
        return waitingStackView
    }()
    private let waitingLabel: UILabel = {
        let waitingLabel = UILabel()
        waitingLabel.backgroundColor = .systemGreen
        waitingLabel.textColor = .white
        waitingLabel.text = "대기중"
        waitingLabel.textAlignment = .center
        waitingLabel.font = .preferredFont(forTextStyle: .largeTitle)
        return waitingLabel
    }()
    private let waitingCustomerView: CustomerView = CustomerView()
    
    private let progressStackView: UIStackView = {
        let progressStackView = UIStackView()
        progressStackView.axis = .vertical
        return progressStackView
    }()
    private let progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.backgroundColor = .purple
        progressLabel.textColor = .white
        progressLabel.text = "업무중"
        progressLabel.textAlignment = .center
        progressLabel.font = .preferredFont(forTextStyle: .largeTitle)
        return progressLabel
    }()
    private let progressTableView: UITableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(buttonStackView)
        self.addSubview(timerLabel)
        self.addSubview(queueStackView)
        
        setupButtonStackViewConstraints()
        setupTimerLabelConstraints()
        setupQueueStackViewConstraints()
        setupWaitingStackViewConstraints()
        setupProgressStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    private func setupButtonStackViewConstraints() {
        buttonStackView.addArrangedSubview(addCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupTimerLabelConstraints() {
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor).isActive = true
        timerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        timerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupQueueStackViewConstraints() {
        queueStackView.addArrangedSubview(waitingStackView)
        queueStackView.addArrangedSubview(progressStackView)
        
        queueStackView.translatesAutoresizingMaskIntoConstraints = false
        queueStackView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10).isActive = true
        queueStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        queueStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        queueStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupWaitingStackViewConstraints() {
        waitingStackView.addArrangedSubview(waitingLabel)
    }
    
    private func setupProgressStackViewConstraints() {
        progressStackView.addArrangedSubview(progressLabel)
        progressStackView.addArrangedSubview(progressTableView)
    }
}
