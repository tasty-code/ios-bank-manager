//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
    var startTime: Date?
    var cancellable: Cancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        setConstraint()
        
        increaseCustomerButton.addTarget(nil, action: #selector(tapAddButton(_:)), for: .touchDown)
        resetCustomerButton.addTarget(nil, action: #selector(tapResetButton(_:)), for: .touchDown)
    }
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        stackView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        return stackView
    }()
    
    private let topButtonWrap: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let increaseCustomerButton: UIButton = {
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("고객 10명 추가", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        
        return addButton
    }()
    
    private let resetCustomerButton: UIButton = {
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("초기화", for: .normal)
        addButton.setTitleColor(.red, for: .normal)
        
        return addButton
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - 00:00:000"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue", size: 25)
        
        return label
    }()
    
    private let stateIndiCatorWrap: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let waitingLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35)
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        
        return label
    }()
    
    private let taskingLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35)
        label.textAlignment = .center
        label.backgroundColor = .systemIndigo
        
        return label
    }()
    
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let stateListWrap: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let waitingListWrap: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let taskingListWrap: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let listLabel: UILabel = {
        let label = UILabel()
        label.text = "5 - 예금"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    private let listLabel2: UILabel = {
        let label = UILabel()
        label.text = "4 - 예금"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
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
        
        addNewLabel()
    }
    
    private func addNewLabel() {
        for i in 1...50 {
            let listLabel8: UILabel = {
                let label = UILabel()
                label.text = "\(i) 번"
                label.textColor = .black
                label.font = UIFont.systemFont(ofSize: 24)
                label.textAlignment = .center
                label.heightAnchor.constraint(equalToConstant: 40).isActive = true
                
                return label
            }()
            
            waitingListWrap.addArrangedSubview(listLabel8)
        }
        
        for i in 1...50 {
            let listLabel20: UILabel = {
                let label = UILabel()
                label.text = "\(i) 번"
                label.textColor = .black
                label.font = UIFont.systemFont(ofSize: 24)
                label.textAlignment = .center
                label.heightAnchor.constraint(equalToConstant: 40).isActive = true
                
                return label
            }()
            
            taskingListWrap.addArrangedSubview(listLabel20)
        }
    }
    
    @objc func tapAddButton(_ sender: UIButton) {
        if startTime == nil {
            startTime = Date()
            let subscription = Timer.publish(every: 0.01, on: .main, in: .default)
                .autoconnect()
                .sink { updatedTime in
                    if let startTime = self.startTime {
                        let processingTime = Double(updatedTime.timeIntervalSince(startTime))
                        let miliseconds = Int(processingTime.truncatingRemainder(dividingBy: 1) * 1000)
                        let seconds = Int(processingTime)
                        let minutes = seconds / 60
                        
                        self.timeLabel.text = String(format: "업무시간 - %02d:%02d:%03d", minutes, seconds % 60, miliseconds)
                    }
                }
            cancellable = subscription
        }
    }
    
    @objc func tapResetButton(_ sender: UIButton) {
        timeLabel.text = "업무시간 - 00:00:000"
        cancellable?.cancel()
        cancellable = nil
        startTime = nil
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
