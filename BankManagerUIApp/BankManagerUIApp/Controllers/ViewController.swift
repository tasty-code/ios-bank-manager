//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import UIKit

final class ViewController: UIViewController {
    private let mainView = BankView()
    private let bank = Bank()
    private let timer = WorkTimer()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bank.delegate = self
        timer.delegate = self
        
        mainView.configureView()
        
        mainView.addCustomerButton.addTarget(self, action: #selector(addCustomerButtonTapped), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(resetButtontapped), for: .touchUpInside)
    }
    
    @objc private func addCustomerButtonTapped() {
        bank.lineUpCustomers(amount: 10)
        timer.start()
        bank.runService()
    }
    
    @objc private func resetButtontapped() {
        timer.reset()
        bank.clearLine()
    }
}

extension ViewController: UIUpdateDelegate {
    func updateTimerLabel(_ workTime: Double) {
        updateUI {
            self.mainView.updateWorkTime(workTime)
        }
    }
    
    func addCustomerLabel(_ customer: Customer) {
        updateUI {
            let text = UIText.customerLabel(ticketNumber: customer.ticketNumber, serviceType: customer.serviceType).displayText
            let label = UILabel(text: text, fontSize: 23, textColor: customer.serviceType == .deposit ? .black : .systemPurple)
            self.mainView.addLabelToWaitingStation(label)
        }
    }
    
    func moveCustomerLabel(_ target: Customer) {
        let targetText = UIText.customerLabel(ticketNumber: target.ticketNumber, serviceType: target.serviceType).displayText
        updateUI {
            self.mainView.moveLabelToWorkStation(targetText)
        }
    }
    
    func removeCustomerLabel(_ target: Customer) {
        let targetText = UIText.customerLabel(ticketNumber: target.ticketNumber, serviceType: target.serviceType).displayText
        updateUI {
            self.mainView.removeLabelFromWorkStation(targetText)
        }
    }
    
    func resetAllCustomerLabel() {
        updateUI {
            self.mainView.resetAllStation()
        }
    }
    
    func stopTimer() {
        updateUI {
            if self.mainView.checkAllStationsEmpty() {
                self.timer.stop()
            }
        }
    }
}
