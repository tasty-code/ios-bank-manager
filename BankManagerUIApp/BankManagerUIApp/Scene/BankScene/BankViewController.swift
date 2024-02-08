//
//  BankManagerUIApp - BankViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class BankViewController: UIViewController {
    
    // TODO: 데이터 위치 수정 예정
    private var waitingQueue: [Client] = [
        Client(number: 1, bankTask: .deposit),
        Client(number: 2, bankTask: .deposit),
        Client(number: 3, bankTask: .deposit),
        Client(number: 4, bankTask: .deposit),
        Client(number: 5, bankTask: .deposit),
        Client(number: 6, bankTask: .deposit),
        Client(number: 7, bankTask: .deposit),
        Client(number: 8, bankTask: .deposit),
        Client(number: 9, bankTask: .deposit),
        Client(number: 10, bankTask: .deposit)
    ]
    
    private var workingQueue: [Client] = [
        Client(number: 1, bankTask: .loan),
        Client(number: 2, bankTask: .loan),
        Client(number: 3, bankTask: .loan),
        Client(number: 4, bankTask: .loan)
    ]

    private let addCustomerButton = UIButton().then {
        $0.setTitle("고객 10명 추가", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    private let resetButton = UIButton().then {
        $0.setTitle("초기화", for: .normal)
        $0.setTitleColor(.systemRed, for: .normal)
    }
    
    private let optionButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let timerLabel = UILabel().then {
        $0.text = "업무시간 - "
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 22)
    }
    
    private let greenView = UIView().then {
        $0.backgroundColor = .systemGreen
    }
    
    private let purpleView = UIView().then {
        $0.backgroundColor = .systemPurple
    }
    
    private let waitingQueueTitleLabel = UILabel().then {
        $0.text = "대기중"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 40)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let workingQueueTitleLabel = UILabel().then {
        $0.text = "업무중"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 40)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let titleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let headerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let waitingQueueTableView = UITableView().then {
        $0.separatorStyle = .none
    }
    
    private let workingQueueTableView = UITableView().then {
        $0.separatorStyle = .none
    }
    
    private let tableStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let entireStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpTableView()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(entireStackView)
        entireStackView.addArrangedSubviews([headerStackView, tableStackView])
        headerStackView.addArrangedSubviews([optionButtonStackView, timerLabel, titleStackView])
        tableStackView.addArrangedSubviews([waitingQueueTableView, workingQueueTableView])
        titleStackView.addArrangedSubviews([greenView, purpleView])
        optionButtonStackView.addArrangedSubviews([addCustomerButton, resetButton])
        greenView.addSubview(waitingQueueTitleLabel)
        purpleView.addSubview(workingQueueTitleLabel)

        NSLayoutConstraint.activate([
            entireStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            entireStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            entireStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            entireStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            headerStackView.heightAnchor.constraint(equalTo: entireStackView.heightAnchor, multiplier: 0.2),
            waitingQueueTitleLabel.topAnchor.constraint(equalTo: greenView.topAnchor),
            waitingQueueTitleLabel.leadingAnchor.constraint(equalTo: greenView.leadingAnchor),
            waitingQueueTitleLabel.trailingAnchor.constraint(equalTo: greenView.trailingAnchor),
            waitingQueueTitleLabel.bottomAnchor.constraint(equalTo: greenView.bottomAnchor),
            workingQueueTitleLabel.topAnchor.constraint(equalTo: purpleView.topAnchor),
            workingQueueTitleLabel.leadingAnchor.constraint(equalTo: purpleView.leadingAnchor),
            workingQueueTitleLabel.trailingAnchor.constraint(equalTo: purpleView.trailingAnchor),
            workingQueueTitleLabel.bottomAnchor.constraint(equalTo: purpleView.bottomAnchor)
        ])
    }
    
    private func setUpTableView() {
        [waitingQueueTableView, workingQueueTableView].forEach {
            $0.register(ClientTableViewCell.self, forCellReuseIdentifier: ClientTableViewCell.className)
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

// MARK: - UITableViewDelegate
extension BankViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

// MARK: - UITableViewDataSource
extension BankViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case waitingQueueTableView:
            return waitingQueue.count
        case workingQueueTableView:
            return workingQueue.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClientTableViewCell.className, for: indexPath) as? ClientTableViewCell
        else { return UITableViewCell() }
        
        switch tableView {
        case waitingQueueTableView:
            cell.setUpData(data: waitingQueue[indexPath.row])
        case workingQueueTableView:
            cell.setUpData(data: workingQueue[indexPath.row])
        default:
            break
        }
        
        return cell
    }
}
