//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    private let bankView: BankView = BankView()
    
    private let bank: Bank = Bank(depositTeller: 2, loanTeller: 1)
    private let dispatchGroup: DispatchGroup = DispatchGroup()

    private var timer: Timer?
    private var processingTime = 0.000
    private var count: Int = 1
    private var isTimerRunning: Bool = false

    override func loadView() {
        view = bankView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        bankView.addClientButton.addTarget(self, action: #selector(addClientButtonTapped), for: .touchUpInside)
        bankView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addClientButtonTapped() {
        for number in count...count + 9 {
            let client = Client(id: number)
            bank.visit(client: client)
            bankView.waitingStackView.addArrangedSubview(ClientLabel(client: client))
        }
        count += 10
        
        bank.delegate = self
        bank.open(with: dispatchGroup)
        
        guard isTimerRunning == false else { return }
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(runningTimer), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .tracking)
        isTimerRunning = true
        dispatchGroup.notify(queue: DispatchQueue.main) { [unowned self] in
            timer?.invalidate()
            isTimerRunning = false
        }
    }
    
    @objc private func resetButtonTapped() {
        bank.stop()
        
        bankView.waitingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        bankView.taskingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        timer?.invalidate()
        timer = nil
        processingTime = 0.000
        bankView.taskTimeLabel.text = "업무시간 - 00:00:000"
        
        count = 1
    }
    
    @objc private func runningTimer() {
        let minutes = Int(processingTime) / 60
        let seconds = Int(processingTime) % 60
        let milliSeconds = Int((processingTime.truncatingRemainder(dividingBy: 1)) * 1000)
        
        bankView.taskTimeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds, milliSeconds)
        processingTime += 0.001
    }

}

protocol ManagingForClientLabel: AnyObject {
    func move(who client: Client)
    func remove(who client: Client)
}

extension ViewController: ManagingForClientLabel {
    func move(who client: Client) {
        DispatchQueue.main.async { [unowned self] in
            bankView.waitingStackView.arrangedSubviews.forEach { view in
                guard let clientLabel = view as? ClientLabel else { return }
                guard clientLabel.client.id == client.id else { return }
                clientLabel.removeFromSuperview()
            }
            bankView.taskingStackView.addArrangedSubview(ClientLabel(client: client))
        }
    }
    
    func remove(who client: Client) {
        DispatchQueue.main.async { [unowned self] in
            bankView.taskingStackView.arrangedSubviews.forEach { view in
                guard let clientLabel = view as? ClientLabel else { return }
                guard clientLabel.client.id == client.id else { return }
                clientLabel.removeFromSuperview()
            }
        }
    }
}
