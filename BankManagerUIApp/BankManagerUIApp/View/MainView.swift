
import UIKit

class MainView: UIView {
    private let addCustomerButton: UIButton = {
        let addCustomerButton = UIButton()
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        addCustomerButton.setTitleColor(.systemBlue, for: .normal)
        addCustomerButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        return addCustomerButton
    }()
    
    private let resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        resetButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        return resetButton
    }()
    
    private let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        return buttonStackView
    }()
    
    private let timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.font = .preferredFont(forTextStyle: .title1)
        timerLabel.text = "test"
        timerLabel.textAlignment = .center
        return timerLabel
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
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(buttonStackView)
        self.addSubview(timerLabel)
        
        buttonStackView.addArrangedSubview(addCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor).isActive = true
        timerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        timerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        waitingLabel.translatesAutoresizingMaskIntoConstraints = false
        waitingLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10).isActive = true
        waitingLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        waitingLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
