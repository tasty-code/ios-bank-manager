//
//  BankManagerUIApp - BankViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class BankViewController: UIViewController {
    // MARK: - Properties
    
    private let viewModel: BankIntput
    
    // MARK: - UI Elements
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
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(self.addClientButton)
        stackView.addArrangedSubview(self.clearButton)
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
    
    // MARK: - Initializers
    
    init(bankMirror: BankIntput) {
        self.viewModel = bankMirror
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        setButtonAction()
        self.waitingListTableView.delegate = self
        self.workingListTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let count = (10...30).randomElement()!
        runBank(count: count)
    }
}

// MARK: - UITableViewDelegate
extension BankViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return (tableView as? ClientListTableView)?.makeHeader()
    }
}

// MARK: - BankOutput
extension BankViewController: BankOutput {
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
    
    func updateTime(with timeString: String) {
        DispatchQueue.main.async {
            self.applyUpdatedTime(with: timeString)
        }
    }
}

// MARK: - Private Methods
private extension BankViewController {
    private func setButtonAction() {
        self.addClientButton.addAction(
            UIAction { _ in self.addClient(count: 10) },
            for: .touchUpInside
        )
        
        self.clearButton.addAction(
            UIAction { _ in self.resetBank() },
            for: .touchUpInside
        )
    }
    
    func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(containerView)
        self.addClientButton.translatesAutoresizingMaskIntoConstraints = false
        self.clearButton.translatesAutoresizingMaskIntoConstraints = false
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
    
    func addClient(count: Int) {
        
    }
    
    func runBank(count: Int) {
        self.viewModel.startBank(withCount: count)
    }
    
    func resetBank() {
        self.viewModel.resetBank()
    }
    
    func applyUpdatedWaitingList(with list: [Client]) {
        var snapshot = ClientListSnapShot()
        snapshot.appendSections([.client])
        let items = list.map(ClientListItem.client)
        snapshot.appendItems(items, toSection: .client)
        self.waitingListDataSource.apply(snapshot)
    }
    
    func applyUpdatedWorkingList(with list: [Client]) {
        var snapshot = ClientListSnapShot()
        snapshot.appendSections([.client])
        let items = list.map(ClientListItem.client)
        snapshot.appendItems(items, toSection: .client)
        self.workingListDataSource.apply(snapshot)
    }
    
    func applyUpdatedTime(with timeString: String) {
        self.timerView.configure(with: timeString)
    }
}
