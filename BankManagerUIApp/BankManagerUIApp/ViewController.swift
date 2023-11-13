import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let tenCustomerAddButton = UIButton(title: "고객 10명 추가", titleColor: .systemBlue)
        let initializationButton = UIButton(title: "초기화", titleColor: .systemRed)
        let customerInitializationStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, arrangedSubviews: [tenCustomerAddButton, initializationButton])
        
        let workTimeLabel = UILabel(text: "업무시간 - 00:00:000", fontSize: 20, textColor: .black)
                
        let waitingLabel = UILabel(text: "대기중", fontSize: 30, textColor: .white, backgroundColor: .systemGreen)
        let workingLabel = UILabel(text: "업무중", fontSize: 30, textColor: .white, backgroundColor: .systemIndigo)
        let waitingWorkingLabelStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 0, arrangedSubviews: [waitingLabel, workingLabel])
        
        let waitingQueueStackView = UIStackView(axis: .vertical, distribution: .fillEqually, arrangedSubviews: addCustomer(until: 100))
        let waitingQueue = UIScrollView(subView: waitingQueueStackView)
 
        let workingQueueStackView =  UIStackView(axis: .vertical, distribution: .fill, alignment: .fill, arrangedSubviews: addCustomer(until: 3))
        let workingQueue = UIScrollView(subView: workingQueueStackView, isScrollEnabled: false)

        let waitingWorkingQueueStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 0, arrangedSubviews: [waitingQueue, workingQueue])

        let upperStackView = UIStackView(axis: .vertical, distribution: .fillEqually, alignment: .fill, arrangedSubviews: [customerInitializationStackView, workTimeLabel, waitingWorkingLabelStackView])
        let stackView = UIStackView(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 0, arrangedSubviews: [upperStackView, waitingWorkingQueueStackView])

        view.addSubview(stackView)
    
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0),
            
            waitingQueueStackView.leadingAnchor.constraint(equalTo: waitingQueue.leadingAnchor),
            waitingQueueStackView.trailingAnchor.constraint(equalTo: waitingQueue.trailingAnchor),
            waitingQueueStackView.topAnchor.constraint(equalTo: waitingQueue.topAnchor),
            waitingQueueStackView.bottomAnchor.constraint(equalTo: waitingQueue.bottomAnchor),
            waitingQueueStackView.widthAnchor.constraint(equalTo: waitingQueue.widthAnchor),
            
            workingQueueStackView.leadingAnchor.constraint(equalTo: workingQueue.leadingAnchor),
            workingQueueStackView.trailingAnchor.constraint(equalTo: workingQueue.trailingAnchor),
            workingQueueStackView.topAnchor.constraint(equalTo: workingQueue.topAnchor),
            workingQueueStackView.bottomAnchor.constraint(equalTo: workingQueue.bottomAnchor),
            workingQueueStackView.widthAnchor.constraint(equalTo: workingQueue.widthAnchor),
            
        ])
    }
}

func addCustomer(until maxCustomer: Int) -> [UIView] {
    var views: [UIView] = []
    
    for index in 1...maxCustomer {
        views.append(UILabel(text: "\(index)번", textColor: .black))
    }
    return views
}

extension UIButton {
    convenience init(title: String, titleColor: UIColor = .black, backgroundColor: UIColor = .white) {
        self.init()
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentHorizontalAlignment = .center
    }
}

extension UILabel {
    convenience init(text: String, fontSize: CGFloat = 10, textColor: UIColor, backgroundColor: UIColor = .white) {
        self.init()
        
        self.text = text
        self.font = .systemFont(ofSize: fontSize)
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.textAlignment = .center
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 8, arrangedSubviews: [UIView] = []) {
        self.init()
        
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        
        arrangedSubviews.forEach {
            self.addArrangedSubview($0)
        }

        self.isLayoutMarginsRelativeArrangement = false
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIScrollView {
    convenience init(subView: UIView, isScrollEnabled: Bool = true) {
        self.init()
    
        self.addSubview(subView)
    
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsVerticalScrollIndicator = false
        self.isScrollEnabled = isScrollEnabled
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
