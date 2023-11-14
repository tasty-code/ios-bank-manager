import UIKit

class ViewController: UIViewController {
    var waitingQueueStackView: UIStackView!
    var workingQueueStackView: UIStackView!
    var timer: Timer? = nil
    var elapsedTime: TimeInterval = 0.000
    
    
    let workTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - 00:00:000"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        startTimer()
        
        let tenCustomerAddButton = UIButton(title: "고객 10명 추가", titleColor: .systemBlue)
        let initializationButton = UIButton(title: "초기화", titleColor: .systemRed)
        let customerInitializationStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, arrangedSubviews: [tenCustomerAddButton, initializationButton])
        
        workTimeLabel.textAlignment = .center
        
        let waitingLabel = UILabel(text: "대기중", fontSize: 30, textColor: .white, backgroundColor: .systemGreen)
        let workingLabel = UILabel(text: "업무중", fontSize: 30, textColor: .white, backgroundColor: .systemIndigo)
        let waitingWorkingLabelStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, spacing: 0, arrangedSubviews: [waitingLabel, workingLabel])
        
        waitingQueueStackView = UIStackView(axis: .vertical, distribution: .fillEqually, arrangedSubviews: addWaitCustomer(3))
        let waitingQueue = UIScrollView(subView: waitingQueueStackView)
        
        workingQueueStackView =  UIStackView(axis: .vertical, distribution: .fill, alignment: .fill, arrangedSubviews: addWaitCustomer(3))
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
        
        tenCustomerAddButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        initializationButton.addTarget(self, action: #selector(initializeCustomer), for: .touchUpInside)
    }
    
    @objc func addCustomer() {
        for index in 1...10 {
            let label = UILabel(text: "\(index)번 고객", fontSize: 20, textColor: .black)
            waitingQueueStackView.addArrangedSubview(label)
        }
        startTimer()
    }
    
    func startTimer() {
        if let timer = timer {
            
        } else {
            DispatchQueue.global(qos: .userInteractive).async { [self] in
                timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
                RunLoop.current.run()
            }
        }
    }
    
    @objc func initializeCustomer() {
        waitingQueueStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        workingQueueStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        timer?.invalidate()
        timer = nil
        DispatchQueue.main.async { [self] in
            elapsedTime = 0.000
            workTimeLabel.text = "업무시간 - 00:00:000"
        }
    }
    
    @objc func updateTimer() {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        let milliseconds = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 1000)
        
        DispatchQueue.main.async { [self] in
            workTimeLabel.font = UIFont(name: "HelveticaNeue", size: 20)
            workTimeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds, milliseconds)
        }
        elapsedTime += 0.001
    }
    
    func addWaitCustomer(_ maxCustomer: Int) -> [UIView] {
        var views = [UIView]()
        for index in 1...maxCustomer {
            let customer = UILabel()
            customer.text = "\(index)번 고객"
            customer.textAlignment = .center
            customer.font = .systemFont(ofSize: 20)
            views.append(customer)
        }
        return views
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
