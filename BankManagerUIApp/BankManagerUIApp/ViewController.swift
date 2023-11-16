import UIKit
// 1. 디스패치로 인한 뒤늦게 일 끝낸 루팡들 제거, 2. 순번 초기화
class ViewController: UIViewController {
    private let contentView = ContentView()
    private var timer: Timer? = nil
    private var elapsedTime: TimeInterval = 0.000
    private lazy var bank = Bank(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        startTimer()
        startBank()
        
        contentView.addCustomerButton.addTarget(self, action: #selector(startBank), for: .touchUpInside)
        
        contentView.resetButton.addTarget(self, action: #selector(resetCustomer), for: .touchUpInside)
    }
    
    private func startTimer() {
        DispatchQueue.global(qos: .userInteractive).async { [self] in
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            RunLoop.current.run()
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
        elapsedTime = 0.000

        contentView.resetCustomer()
        DispatchQueue.main.async { [self] in
            contentView.resetWorkingTimeLabel()
        }
        
        bank.prepareCloseWork()
    }
    
    @objc private func startBank() {
        let queue = bank.greetCustomer()
        var customer = queue.head

        while customer != nil {
            guard let currentCustomer = customer?.data else {
                return
            }
            
            contentView.add(currentCustomer, to: contentView.waitingStackView)
            customer = customer?.next
        }
        
        guard let timer = timer else {
            return
        }
        
        if !timer.isValid {
            startTimer()
        }
        bank.startWork()
    }
}

extension ViewController: BankerDelegate {
    func addWorkingStackView(_ banker: Banker, _ customer: Customer) {
        DispatchQueue.main.async { [self] in
            contentView.deleteStackView(customer, to: contentView.waitingStackView)
            contentView.add(customer, to: contentView.workingStackView)
        }
    }
    
    func deleteWorkingStackView(_ banker: Banker, _ customer: Customer) {
        DispatchQueue.main.async { [self] in
            contentView.deleteStackView(customer, to: contentView.workingStackView)
            
            if contentView.waitingStackView.arrangedSubviews.isEmpty && contentView.workingStackView.arrangedSubviews.isEmpty {
                timer?.invalidate()
            }
        }
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
