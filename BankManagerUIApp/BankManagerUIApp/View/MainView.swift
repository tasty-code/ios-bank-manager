
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
    
    private let taskLabelStackView: UIStackView = {
        let taskLabelStackView = UIStackView()
        taskLabelStackView.axis = .horizontal
        taskLabelStackView.distribution = .fillEqually
        return taskLabelStackView
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
    private let progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.backgroundColor = .purple
        progressLabel.textColor = .white
        progressLabel.text = "업무중"
        progressLabel.textAlignment = .center
        progressLabel.font = .preferredFont(forTextStyle: .largeTitle)
        return progressLabel
    }()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    private let waitingStackView: UIStackView = {
        let waitingStackView = UIStackView()
        waitingStackView.axis = .vertical
        return waitingStackView
    }()
    
    private let progressStackView: UIStackView = {
        let progressStackView = UIStackView()
        progressStackView.axis = .vertical
        return progressStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(buttonStackView)
        self.addSubview(timerLabel)
        self.addSubview(taskLabelStackView)
        self.addSubview(stackView)
        
        setupButtonStackViewConstraints()
        setupTimerLabelConstraints()
        setupTaskLabelStackViewConstraints ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    func appendWaitingCustomerView() {
        
    }
    
    func appendProgressCustomerview() {
       
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
    
    private func setupTaskLabelStackViewConstraints() {
        taskLabelStackView.addArrangedSubview(waitingLabel)
        taskLabelStackView.addArrangedSubview(progressLabel)
        
        taskLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        taskLabelStackView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10).isActive = true
        taskLabelStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        taskLabelStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupStackViewConstraints() {
        stackView.addArrangedSubview(waitingStackView)
        stackView.addArrangedSubview(progressStackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: taskLabelStackView.bottomAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
