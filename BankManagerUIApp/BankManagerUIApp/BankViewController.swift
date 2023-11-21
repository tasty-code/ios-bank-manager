import UIKit

final class BankViewController: UIViewController {
    private let bankView = BankView()
    private var timer: Timer = Timer()
    private var elapsedTime: TimeInterval = 0.000
    private lazy var bank = Bank(bankerDelegate: self, bankDelegate: self)
    
    override func loadView() {
        view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startBank()
        
        bankView.addCustomerButton.addTarget(self, action: #selector(startBank), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
    }
    
    private func startTimer() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else {
                return
            }
            
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            RunLoop.current.run()
        }
    }
    
    @objc private func updateTimer() {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        let milliseconds = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 1000)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            bankView.updateTimer(minutes, seconds, milliseconds)
        }
        elapsedTime += 0.001
    }
    
    @objc private func startBank() {
        bank.greetCustomer()
        
        if !timer.isValid {
            startTimer()
        }
        
        bank.startWork()
    }
    
    @objc private func reset() {
        timer.invalidate()
        elapsedTime = 0.000
        
        bankView.resetCustomer()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            bankView.resetWorkingTimeLabel()
        }
        bank.prepareCloseWork()
    }
}

extension BankViewController: BankDelegate {
    func addWaitingStackView(_ bank: Bank, _ customer: Customer) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            bankView.addWaitingStackView(customer)
        }
    }
}

extension BankViewController: BankerDelegate {
    func addWorkingStackView(_ banker: Banker, _ customer: Customer) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            bankView.deleteWaitingStackView(customer)
            bankView.addWorkingStackView(customer)
        }
    }
    
    func deleteWorkingStackView(_ banker: Banker, _ customer: Customer) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            bankView.deleteWorkingStackView(customer)
            
            bankView.checkInvalidate {
                self.timer.invalidate()
            }
        }
    }
}
