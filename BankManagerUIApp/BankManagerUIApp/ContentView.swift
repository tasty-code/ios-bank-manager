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
        label.font = UIFont(name: "Helvetica", size: 25)
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
        let stackView = UIStackView(axis: .vertical, arrangedSubviews: [upperStackView, lowerStackView])
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
        setWaitingScrollViewConstraint()
        setWorkingScrollViewConstraint()
    }
    
    private func setContentStackViewConstraint() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: safeArea.topAnchor),
        ])
    }
    
    private func setWaitingScrollViewConstraint() {
        NSLayoutConstraint.activate([
            waitingScrollView.widthAnchor.constraint(equalTo: waitingStackView.widthAnchor)
        ])
    }
    
    private func setWorkingScrollViewConstraint() {
        NSLayoutConstraint.activate([
            workingScrollView.widthAnchor.constraint(equalTo: workingStackView.widthAnchor)
        ])
    }
}



#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {

    func updateUIViewController(_ uiViewController: UIViewController, context: Context){

    }

    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View{
        ViewControllerRepresentable().previewDisplayName("iPhone 15")
    }
}
#endif
