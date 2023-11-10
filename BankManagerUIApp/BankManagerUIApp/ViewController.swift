//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private let addCustomerButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addCustomerButton,resetButton])
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        
        return stackView
    }()
    
    private let workTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "업무시간 - 04:33:253"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(23)
        
        return label
    }()
    
    private let waitingListLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.font = label.font.withSize(30)
        
        return label
    }()
    
    private let waitingListTabelView: UITableView = {
        let tableView = UITableView()
        //        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private lazy var waitingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [waitingListLabel,waitingListTabelView])
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        stackView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        
        return stackView
    }()
    private let waitingListTableViewCell: UITableViewCell = {
        let tableViewCell = UITableViewCell(style: .default, reuseIdentifier: "waitng")
        
        return tableViewCell
    }()
    
    
    private let workingListLabel: UILabel = {
        let label = UILabel()
        label.text = "업무중"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemIndigo
        label.font = label.font.withSize(30)
        
        return label
    }()
    
    private let workingListTableView: UITableView = {
        let tableView = UITableView()
        //        tableView.separatorStyle = .none
    
        return tableView
    }()
    
    private let workingListTableViewCell: UITableViewCell = {
        let tableViewCell = UITableViewCell(style: .default, reuseIdentifier: "custom")
        
        return tableViewCell
    }()
    
    
    
    private lazy var workingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [workingListLabel,workingListTableView])
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var dashBoardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [waitingStackView,workingStackView])
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonStackView,workTimeLabel,dashBoardStackView])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    func configureTableView() {
        workingListTableView.register(type(of: workingListTableViewCell), forCellReuseIdentifier: "custom")
        waitingListTabelView.register(type(of: workingListTableViewCell), forCellReuseIdentifier: "waiting")
        
        waitingListTabelView.delegate = self
        waitingListTabelView.dataSource = self
        workingListTableView.delegate = self
        workingListTableView.dataSource = self
    }
    
    func configureUI() {
        configureTableView()
        
        view.backgroundColor = .white
        view.addSubview(rootStackView)
        
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            rootStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            rootStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            rootStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
}

extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case self.waitingListTabelView: return 20
        case self.workingListTableView: return 100
        default: return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.waitingListTabelView {
            let waitingcell = tableView.dequeueReusableCell(withIdentifier: "waiting", for: indexPath)
            
            return waitingcell
        } else {
            let workingcell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath)
            
            return workingcell
        }
    }
}
