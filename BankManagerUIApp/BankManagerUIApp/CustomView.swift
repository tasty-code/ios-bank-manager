import UIKit

final class CustomView: UIView {
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
        let label = UILabel(text: "업무시간 - 00:00:000", fontSize: 30, textColor: .black, backgroundColor: .clear)
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
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually, alignment: .fill, spacing: 10, arrangedSubviews: [buttonStackView, workingTimeLabel, labelStackView])
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
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, arrangedSubviews: [upperStackView, lowerStackView])
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
