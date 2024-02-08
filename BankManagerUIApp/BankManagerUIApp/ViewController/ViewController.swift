//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: Properties
    
    private let bankMirror: BankIntput
    
    // MARK: UI Elements
    private let addClientButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("시작", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(self.addClientButton)
        stackView.addArrangedSubview(self.clearButton)
        stackView.addArrangedSubview(self.startButton)
        return stackView
    }()
    
    private let timerView: TimerView = TimerView()
    
    private let waitingListTableView = ClientListTableView(type: .waiting)
    
    private let workingListTableView = ClientListTableView(type: .working)
    
    private lazy var listStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(self.waitingListTableView)
        stackView.addArrangedSubview(self.workingListTableView)
        return stackView
    }()
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        
        stackView.addArrangedSubview(self.buttonStackView)
        stackView.addArrangedSubview(self.timerView)
        stackView.addArrangedSubview(self.listStackView)
        
        return stackView
    }()
    
    private lazy var waitingListDataSource = ClientListDataSource(self.waitingListTableView)
    
    private lazy var workingListDataSource = ClientListDataSource(self.workingListTableView)
    
    // MARK: Initializer
    
    init(bankMirror: BankIntput) {
        self.bankMirror = bankMirror
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        self.waitingListTableView.delegate = self
        self.workingListTableView.delegate = self
        setButtonAction()
        addClient(count: 5)
    }
    
    private func setButtonAction() {
        self.startButton.addAction(
            UIAction { _ in self.runBank() },
            for: .touchUpInside
        )
        
        self.addClientButton.addAction(
            UIAction { _ in self.addClient(count: 10) },
            for: .touchUpInside
        )
        
        self.clearButton.addAction(
            UIAction { _ in self.resetBank() },
            for: .touchUpInside
        )
    }
    
    private func addClient(count: Int) {
        print(self, #function)
        self.bankMirror.addClients(count: count)
    }
    
    private func runBank() {
        print(self, #function)
        self.bankMirror.startBank()
    }
    
    private func resetBank() {
        print(self, #function)
        self.bankMirror.resetBank()
    }
}

private extension ViewController {
    func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(containerView)
        self.addClientButton.translatesAutoresizingMaskIntoConstraints = false
        self.clearButton.translatesAutoresizingMaskIntoConstraints = false
        self.startButton.translatesAutoresizingMaskIntoConstraints = false
        self.buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        self.timerView.translatesAutoresizingMaskIntoConstraints = false
        self.waitingListTableView.translatesAutoresizingMaskIntoConstraints = false
        self.workingListTableView.translatesAutoresizingMaskIntoConstraints = false
        self.listStackView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.containerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            self.buttonStackView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            self.timerView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
        ])
    }
    
    private func applyUpdatedWaitingList(with list: [Client]) {
        var snapshot = ClientListSnapShot()
        snapshot.appendSections([.client])
        let items = list.map(ClientListItem.client)
        snapshot.appendItems(items, toSection: .client)
        self.waitingListDataSource.apply(snapshot)
    }
    
    private func applyUpdatedWorkingList(with list: [Client]) {
        var snapshot = ClientListSnapShot()
        snapshot.appendSections([.client])
        let items = list.map(ClientListItem.client)
        snapshot.appendItems(items, toSection: .client)
        self.workingListDataSource.apply(snapshot)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return (tableView as? ClientListTableView)?.getHeader()
    }
}

extension ViewController: BankOutput {
    func updateWaitingList(with clients: [Client]) {
        DispatchQueue.main.async {
            self.applyUpdatedWaitingList(with: clients)
        }
    }
    
    func updateWorkingList(with clients: [Client]) {
        DispatchQueue.main.async {
            self.applyUpdatedWorkingList(with: clients)
        }
    }
}
