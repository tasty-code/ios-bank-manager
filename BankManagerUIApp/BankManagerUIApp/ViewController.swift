//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bankManager: BankManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bankManager = BankManager(bank: Bank(customerQueue: Queue<Customer>(), waitingHandler: { label in
            self.waitingListWrap.addArrangedSubview(label)
        }, changingHandler: { label in
//            if !label.customer.workable {
//                return
//            }
            self.waitingListWrap.removeArrangedSubview(label)
            self.taskingListWrap.addArrangedSubview(label)
        }, processingHandler: { label in
            self.taskingListWrap.removeArrangedSubview(label)
            label.removeFromSuperview()
        }))
        
        setupContentView()
        setConstraint()
    }
    
    private let contentStackView = UIStackView(.vertical, 15, .fill)
    
    private let topButtonWrap = UIStackView(.horizontal, 0, .fillEqually)
    
    private let stateIndiCatorWrap = UIStackView(.horizontal, 0, .fillEqually)
    
    private lazy var timeLabel = TimerLabel(prefix: "업무시간", fontSize: 24)
    
    private let waitingLabel = UILabel("대기중", 35, .white, .center, .systemGreen)
    
    private let taskingLabel = UILabel("업무중", 35, .white, .center, .systemIndigo)
    
    private let waitingListWrap = UIStackView(.vertical, 0, .fillEqually)
    
    private let taskingListWrap = UIStackView(.vertical, 0, .fillEqually)
    
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let stateListWrap: UIStackView = {
        let stackView = UIStackView(.horizontal, 0, .fillEqually)
        stackView.alignment = .top
        
        return stackView
    }()
    
    private let increaseCustomerButton: UIButton = {
        let addButton = UIButton("고객 10명 추가", .systemBlue)
        addButton.addTarget(nil, action: #selector(tapAddButton(_:)), for: .touchDown)
        
        return addButton
    }()
    
    private let resetCustomerButton: UIButton = {
        let addButton = UIButton("초기화", .systemRed)
        addButton.addTarget(nil, action: #selector(tapResetButton(_:)), for: .touchDown)
        
        return addButton
    }()
}

extension ViewController {
    
    private func setupContentView() {
        self.view.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(topButtonWrap)
        topButtonWrap.addArrangedSubview(increaseCustomerButton)
        topButtonWrap.addArrangedSubview(resetCustomerButton)
        
        contentStackView.addArrangedSubview(timeLabel)
        
        contentStackView.addArrangedSubview(stateIndiCatorWrap)
        stateIndiCatorWrap.addArrangedSubview(waitingLabel)
        stateIndiCatorWrap.addArrangedSubview(taskingLabel)
        
        self.view.addSubview(contentScrollView)
        contentScrollView.addSubview(stateListWrap)
        
        stateListWrap.addArrangedSubview(waitingListWrap)
        stateListWrap.addArrangedSubview(taskingListWrap)
    }
    
    private func setConstraint(){
        self.view.backgroundColor = .white
        NSLayoutConstraint.activate([
            
            contentStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            contentStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0),
            
            contentScrollView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            
            stateListWrap.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            stateListWrap.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            stateListWrap.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            stateListWrap.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            stateListWrap.widthAnchor.constraint(equalTo: contentScrollView.frameLayoutGuide.widthAnchor, multiplier: 1.0),
        ])
    }
    
}

extension ViewController {
    @objc func tapAddButton(_ sender: UIButton) {
        timeLabel.startTimer()
        generateCustomers()
    }
    
    @objc func tapResetButton(_ sender: UIButton) {
        timeLabel.resetTimer()
        resetCustomers()
    }
    
    func generateCustomers() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.bankManager?.openBank(completionHander: {
                self.timeLabel.pauseTimer()
            })
        }
    }
    
    func resetCustomers() {
        bankManager?.resetBank()
        for label in waitingListWrap.arrangedSubviews {
            if let label = label as? CustomerLabel {
                label.customer.workable = false
                label.removeFromSuperview()
            }
        }
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context){
        
    }
    // makeui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View{
        ViewControllerRepresentable().previewDisplayName(nil)
    }
}
#endif
