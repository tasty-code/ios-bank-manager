//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let mainView: MainView
    private let dataSource: BankManager
    
    init(dataSource: BankManager) {
        self.mainView = MainView()
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        dataSource.delegate = mainView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        view.backgroundColor = .white
        
        mainView.waitingQueueDataSource = self
        mainView.progressQueueDataSource = self
    }
    
    @objc func addCustomerButtonTapped() {
        if dataSource.isQueueRunning {
            dataSource.addCustomer()
            mainView.reloadWaitingQueueData()
            return
        }
        dataSource.addCustomer()
        dataSource.startBankingProcess()
        mainView.reloadWaitingQueueData()
    }
    
    @objc func resetService() {
        // 타이머 초기화
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as? CustomCell else {
            return CustomCell()
        }
        let customer = dataSource.totalCustomerInQueue[indexPath.row]
        cell.setLabelText(customerNumber: customer.waitingNumber, serviceType: customer.requiredService.value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.totalCustomerInQueue.count
    }
}
