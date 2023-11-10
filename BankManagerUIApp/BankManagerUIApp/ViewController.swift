//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 


import UIKit

final class ViewController: UIViewController {
    
    private let bankManager = BankManager(depositTellerCount: 2, loanTellerCount: 1)
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var addCustomerButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        return button
    }()
    
    private lazy var timerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "업무 시간 - 04:44:44"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var readyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        label.textColor = .white
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    private lazy var runningTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        label.textColor = .white
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    private lazy var listStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var readyListView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var runningListView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var readyListScrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var runningListScrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var readyListStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    private lazy var runningListStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private lazy var temp1: UILabel = {
        let label = UILabel()
        label.text = "1 - 예금"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var temp2: UILabel = {
        let label = UILabel()
        label.text = "2 - 대출"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        label.textColor = .orange
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        setupAutoLayout()
        
       
        
    }

    
    func configure() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(timerTitleLabel)
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(listStackView)
        
        buttonStackView.addArrangedSubview(addCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        titleStackView.addArrangedSubview(readyTitleLabel)
        titleStackView.addArrangedSubview(runningTitleLabel)
        
        listStackView.addArrangedSubview(readyListView)
        listStackView.addArrangedSubview(runningListView)
        
        readyListView.addSubview(readyListScrollView)
        runningListView.addSubview(runningListScrollView)
        
        readyListScrollView.addSubview(readyListStackView)
        runningListScrollView.addSubview(runningListStackView)
        
        readyListStackView.addArrangedSubview(temp1)
        readyListStackView.addArrangedSubview(temp2)
        
    }
    
    func setupAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        readyListScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        readyListScrollView.topAnchor.constraint(equalTo: readyListView.topAnchor).isActive = true
        readyListScrollView.bottomAnchor.constraint(equalTo: readyListView.bottomAnchor).isActive = true
        readyListScrollView.leadingAnchor.constraint(equalTo: readyListView.leadingAnchor).isActive = true
        readyListScrollView.trailingAnchor.constraint(equalTo: readyListView.trailingAnchor).isActive = true
        
        runningListScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        runningListScrollView.topAnchor.constraint(equalTo: runningListView.topAnchor).isActive = true
        runningListScrollView.bottomAnchor.constraint(equalTo: runningListView.bottomAnchor).isActive = true
        runningListScrollView.leadingAnchor.constraint(equalTo: runningListView.leadingAnchor).isActive = true
        runningListScrollView.trailingAnchor.constraint(equalTo: runningListView.trailingAnchor).isActive = true
        
        readyListStackView.translatesAutoresizingMaskIntoConstraints = false
        
        readyListStackView.topAnchor.constraint(equalTo: readyListScrollView.topAnchor).isActive = true
        readyListStackView.bottomAnchor.constraint(equalTo: readyListScrollView.bottomAnchor).isActive = true
        readyListStackView.leadingAnchor.constraint(equalTo: readyListScrollView.leadingAnchor).isActive = true
        readyListStackView.trailingAnchor.constraint(equalTo: readyListScrollView.trailingAnchor).isActive = true
        readyListStackView.widthAnchor.constraint(equalTo: readyListScrollView.widthAnchor).isActive = true
        
        runningListStackView.translatesAutoresizingMaskIntoConstraints = false
        
        runningListStackView.topAnchor.constraint(equalTo: runningListStackView.topAnchor).isActive = true
        runningListStackView.bottomAnchor.constraint(equalTo: runningListStackView.bottomAnchor).isActive = true
        runningListStackView.leadingAnchor.constraint(equalTo: runningListStackView.leadingAnchor).isActive = true
        runningListStackView.trailingAnchor.constraint(equalTo: runningListStackView.trailingAnchor).isActive = true
        runningListStackView.widthAnchor.constraint(equalTo: runningListScrollView.widthAnchor).isActive = true
    }
    
    @objc func addCustomer() {
//        
//        bankManager.createCustomerQueue(customerCount: 10)
//        for _ in 1...10 {
//            
//            let customerLabel = UILabel()
//            readyListStackView.addArrangedSubview(customerLabel)
//        }
//        
//       guard let de = bankManager.depositCustomerQueue.peek()
//        
//        if bankManager.depositCustomerQueue.peek() > bankManager.loanCustomerQueue.peek() {
//            
//        }
//        
        
    }
    
    @objc func resetTimer() {
        
    }
    
    
    
    func setupLabel() {
        
       
        
        
    }
    
    
    
}


#if canImport(SwiftUI)
import SwiftUI

struct Preview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ interfaceBuilder: @escaping () -> View) {
        view = interfaceBuilder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

struct Previewer: PreviewProvider {
    static var previews: some View {
        Preview {
            let viewController = ViewController()
            return viewController.view
        }
    }
}
#endif
