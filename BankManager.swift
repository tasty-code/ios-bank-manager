//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import UIKit

protocol BankManagerDelegate: AnyObject {
    func updateWorkTimeLabel(_ formattedString: String)
}

protocol UIUpdatable: AnyObject {
    func addLabel(_ target: Customer)
    func moveLabelToWorkStation(_ target: Customer)
    func removeAll()
}

class BankManager {
    private let bank = Bank()
    private var timer: Timer?
    private var count: Double = 0
    private var isTimerRunning: Bool = false
    private var numberOfCurrentCustomer: Int = 0
    
    weak var delegate: BankManagerDelegate?
    weak var uiUpdaterDelegate: UIUpdatable?
    
    @objc func updateTimer() {
        count += 0.001
        let formattedString = formatTimeInterval(count)
        delegate?.updateWorkTimeLabel("업무시간 - \(formattedString)")
    }
    
    func startTimer() {
        lineUpCustomer()
        bank.startService({ (customer: Customer) in
            DispatchQueue.main.sync {
                self.uiUpdaterDelegate?.moveLabelToWorkStation(customer)
            }
        }, {
            self.timer?.invalidate()
            self.isTimerRunning = false
        })
        guard !isTimerRunning else { return }
        
        isTimerRunning = true
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        if let timer = timer {
            RunLoop.main.add(timer, forMode: .tracking)
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        isTimerRunning = false
    }
    
    func resetTimer() {
        bank.cancelService()
        timer?.invalidate()
        timer = nil
        count = 0
        
        isTimerRunning = false
        numberOfCurrentCustomer = 0
        
        let formattedString = formatTimeInterval(count)
        delegate?.updateWorkTimeLabel("업무시간 - \(formattedString)")
        uiUpdaterDelegate?.removeAll()
        bank.clearLine()
    }
    
    func formatTimeInterval(_ interval: Double) -> String {
        let minutes = Int((interval.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((interval * 1000).truncatingRemainder(dividingBy: 1000))
        return String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
    }
    
    func lineUpCustomer() {
        let offset = numberOfCurrentCustomer + 1
        for i in offset..<offset + 10 {
            let customer = Customer(ticketNumber: i)
            bank.lineUp(customer)
            
            uiUpdaterDelegate?.addLabel(customer)
        }
        
        
        numberOfCurrentCustomer += 10
    }
}
