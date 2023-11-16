import UIKit

class ViewController: UIViewController {
    private let contentView = ContentView()
    private var timer: Timer? = nil
    private var elapsedTime: TimeInterval = 0.000
    private let bank = Bank()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        startTimer()
        startWork()
        
        contentView.addCustomerButton.addTarget(self, action: #selector(startWork), for: .touchUpInside)
        
        contentView.resetButton.addTarget(self, action: #selector(resetCustomer), for: .touchUpInside)
    }
    
    private func startTimer() {
        if let timer = timer {

        } else {
            DispatchQueue.global(qos: .background).async { [self] in
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                RunLoop.current.run()
            }
        }
    }
    
    @objc private func updateTimer() {
       let minutes = Int(elapsedTime) / 60
       let seconds = Int(elapsedTime) % 60
       let milliseconds = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 1000)

       DispatchQueue.main.async { [self] in
           contentView.updateTime(minutes, seconds, milliseconds)
       }
       elapsedTime += 0.001
   }
    
    @objc private func resetCustomer() {
        timer?.invalidate()
        timer = nil
        elapsedTime = 0.000
        
        contentView.resetCustomer()
        DispatchQueue.main.async { [self] in
            contentView.resetWorkingTimeLabel()
        }
    }
    
    @objc private func startWork() {
        let queue = bank.greetCustomer()
        
        while !queue.isEmpty() {
            guard let customer = queue.dequeue() else {
                return
            }
            
            let orderNumber = customer.orderNumber
            let task = customer.task
            let taskName = task.name
            
            contentView.addCustomer(orderNumber, and: taskName)
        }
        if timer == nil {
            startTimer()
        }
    }
}

extension ViewController: ViewControllerDelegate {
    func touchUpCustomerButton() {
        <#code#>
    }
    
    func touchUpResetButton() {
        <#code#>
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


//class ViewController: UIViewController {
//    private let customView = CustomView()
//    private var timer: Timer? = nil
//    private var elapsedTime: TimeInterval = 0.000
//    private let bank = Bank()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view = customView
//        
//        var queue: Queue<Customer> = Queue()
//        DispatchQueue.global().async { [self] in
//            queue = bank.greetCustomer()
//            
//            DispatchQueue.main.async { [self] in
//                work()
//            }
//        }
//        
//        startTimer()
//        La
//    }
//    
//    func greetCustomer(_ queue: Queue<Customer>) -> [UIView] {
//        var views = [UIView]()
//        
//        var customer = queue.head
//        
//        while customer != nil {
//            guard let currentCustomer = customer else {
//                return views
//            }
//            let data = currentCustomer.data
//            let task = data.task
//            
//            let customerLabel = UILabel()
//            customerLabel.textColor = task.name == "대출" ? .systemPurple : .black
//            customerLabel.text = "\(data.orderNumber) - \(task.name)"
//            customerLabel.textAlignment = .center
//            customerLabel.font = .systemFont(ofSize: 20)
//            views.append(customerLabel)
//            
//            guard let nextCustomer = currentCustomer.next else {
//                break
//            }
//            customer = nextCustomer
//        }
//        return views
//    }
//    
//    func work()  {
//        var customer = bank.startWork()
//        
////        DispatchQueue.global(qos: .userInteractive).async { [self] in
////            print("1")
//            while customer != nil {
////                print("2")
//                customer = bank.startWork()
//                guard let customer = customer else {
//                    return
//                }
//                let task = customer.task
//            
//                
//                DispatchQueue.main.async { [self] in
//                    let customerLabel = UILabel()
//                    customerLabel.textColor = task.name == "대출" ? .systemPurple : .black
//                    customerLabel.text = "\(customer.orderNumber) - \(task.name)"
//                    customerLabel.textAlignment = .center
//                    customerLabel.font = .systemFont(ofSize: 20)
//                    customView.waitingQueueStackView.addArrangedSubview(customerLabel)
//                }
////            }
//        }
//    }
//}
