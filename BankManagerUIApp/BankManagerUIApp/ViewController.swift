//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let bankView: BankView = BankView()
    private let bank: Bank = Bank(depositTeller: 2, loanTeller: 1)
    private var timer: Timer?
    private var processingTime = 0.000
    private var count: Int = 1 // 고객 방문 수
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
        // 1. 처음일 경우 타이머 시작
        // 2. 큐에 10명 넣고
        // 3. 10명에 대한 레이블 만들어서 스택뷰에 집어 넣기
        
        for number in count...count + 9 { // 1~10 / 11-20 / 21-30
            let client = Client(id: number)
            bank.visit(client: client) // 큐에 넣고
            let label = identify(client)
            bankView.waitingStackView.addArrangedSubview(label) // 레이블을 스택뷰에 추가
        }
        count += 10
        
        if timer == nil { // timer 객체가 Nil일 때, 새로 만들고 main루프로 보낸다.
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerMethod), userInfo: nil, repeats: true)
            RunLoop.main.add(timer!, forMode: .default)
        }
    }
    
    @objc private func resetButtonTapped() {
        // 1. 큐에 있는 사람 모두 삭제
        bank.clear()
        // 2. 양쪽 스택뷰의 모든 레이블을 지우고
        bankView.waitingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        bankView.taskingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        // 3. 타이머 삭제
        timer?.invalidate()
        timer = nil
        processingTime = 0.000
        bankView.taskTimeLabel.text = "업무시간 - 00:00:000"
    }
    
    @objc private func timerMethod() {
        let minutes = Int(processingTime) / 60
        let seconds = Int(processingTime) % 60
        let milliSeconds = Int((processingTime.truncatingRemainder(dividingBy: 1)) * 1000)
        
        bankView.taskTimeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds, milliSeconds)
        processingTime += 0.001
    }

}

extension ViewController {
    private func identify(_ client: Client) -> UILabel {
        switch client.taskType {
        case .loan:
            return UILabel(text: "\(client.id) - \(client.taskType)", font: .systemFont(ofSize: 23) ,textColor: .systemPurple)
        case .deposit:
            return UILabel(text: "\(client.id) - \(client.taskType)", font: .systemFont(ofSize: 23))
        }
    }
}
