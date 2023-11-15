import UIKit

class ViewController: UIViewController {
    
    private let customView = CustomView()
    private var timer: Timer? = nil
    private var elapsedTime: TimeInterval = 0.000
    private let bank = Bank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        
        var queue: Queue<Customer> = Queue()
        DispatchQueue.global().async { [self] in
            queue = bank.greetCustomer()
            
            DispatchQueue.main.async { [self] in
                work()
            }
        }
        
        startTimer()
        
    }
    
    func greetCustomer(_ queue: Queue<Customer>) -> [UIView] {
        var views = [UIView]()
        
        var customer = queue.head
        
        while customer != nil {
            guard let currentCustomer = customer else {
                return views
            }
            let data = currentCustomer.data
            let task = data.task
            
            let customerLabel = UILabel()
            customerLabel.textColor = task.name == "대출" ? .systemPurple : .black
            customerLabel.text = "\(data.orderNumber) - \(task.name)"
            customerLabel.textAlignment = .center
            customerLabel.font = .systemFont(ofSize: 20)
            views.append(customerLabel)
            
            guard let nextCustomer = currentCustomer.next else {
                break
            }
            customer = nextCustomer
        }
        return views
    }
    
    func work()  {
        var customer = bank.startWork()
        
//        DispatchQueue.global(qos: .userInteractive).async { [self] in
//            print("1")
            while customer != nil {
//                print("2")
                customer = bank.startWork()
                guard let customer = customer else {
                    return
                }
                let task = customer.task
            
                
                DispatchQueue.main.async { [self] in
                    let customerLabel = UILabel()
                    customerLabel.textColor = task.name == "대출" ? .systemPurple : .black
                    customerLabel.text = "\(customer.orderNumber) - \(task.name)"
                    customerLabel.textAlignment = .center
                    customerLabel.font = .systemFont(ofSize: 20)
                    customView.waitingQueueStackView.addArrangedSubview(customerLabel)
                }
//            }
        }
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
    
    @objc func addCustomer() {
        for index in 1...10 {
            let label = UILabel(text: "\(index) - ", fontSize: 20, textColor: .black)
            customView.waitingQueueStackView.addArrangedSubview(label)
        }
        startTimer()
    }
    
    @objc func initializeCustomer() {
        customView.waitingQueueStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        customView.workingQueueStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        timer?.invalidate()
        timer = nil
        DispatchQueue.main.async { [self] in
            elapsedTime = 0.000
            customView.workTimeLabel.text = "업무시간 - 00:00:000"
        }
    }
    
    @objc func updateTimer() {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        let milliseconds = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 1000)
        
        DispatchQueue.main.async { [self] in
            customView.workTimeLabel.font = UIFont(name: "HelveticaNeue", size: 20)
            customView.workTimeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds, milliseconds)
        }
        elapsedTime += 0.001
    }
}



//#if DEBUG
//import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context){
//
//    }
//
//    @available(iOS 13.0, *)
//    func makeUIViewController(context: Context) -> UIViewController {
//        ViewController()
//    }
//}
//
//struct ViewController_Previews: PreviewProvider {
//    static var previews: some View{
//        ViewControllerRepresentable().previewDisplayName("iPhone 15")
//    }
//}
//#endif
