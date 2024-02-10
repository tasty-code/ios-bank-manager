//
//  BankView.swift
//  BankManagerUIApp
//
//  Created by 미르, 희동 on 2/6/24.
//

import UIKit

extension UIButton {
    convenience init(title: String, titleColor: UIColor) {
        self.init()
        
        self.setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(text: String, font: UIFont = .systemFont(ofSize: 20), textColor: UIColor, backgroundColor: UIColor, textAlignment: NSTextAlignment = .center) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.textAlignment = textAlignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment, sapcing: CGFloat = 0, subViews: [UIView] = []) {
        self.init()
        
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self .translatesAutoresizingMaskIntoConstraints = false
        for subView in subViews {
            self.addArrangedSubview(subView)
        }
    }
}

class BankView: UIView {
    let addCustomerButton: UIButton = {
        let button = UIButton(title: "고객 10명 추가", titleColor: .blue)

        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(title: "초기화", titleColor: .red)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
       let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, sapcing: 2, subViews: [addCustomerButton, resetButton])

        return stackView
    }()
    
    let taskTimeLabel: UILabel = {
        let label = UILabel(text: "업무시간 - 00:00:000", textColor: .black, backgroundColor: .clear)
        
        return label
    }()
    
    private let waitLabel: UILabel = {
        let label = UILabel(text: "대기중",font: .preferredFont(forTextStyle: .largeTitle), textColor: .white, backgroundColor: .systemGreen)
        
        return label
    }()
    
    private let taskLabel: UILabel = {
        let label = UILabel(text: "업무중",font: .preferredFont(forTextStyle: .largeTitle), textColor: .white, backgroundColor: .systemIndigo)

        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, subViews: [waitLabel, taskLabel])
        
        return stackView
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually, alignment: .fill, subViews: [buttonStackView, taskTimeLabel, labelStackView])
        
        return stackView
    }()
    
    lazy var waitStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fill, alignment: .fill, sapcing: 10)

        return stackView
    }()
    
    lazy var waitTableView: UITableView = {
        let tableView = UITableView()
        tableView.addSubview(waitStackView)
        
        return tableView
    }()
    
    lazy var taskStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fill, alignment: .fill, sapcing: 10)

        return stackView
    }()
    
    lazy var taskTableView: UITableView = {
        let tableView = UITableView()
        tableView.addSubview(taskStackView)
        
        return tableView
    }()
    
    private lazy var footerStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually, alignment: .fill, subViews: [waitTableView, taskTableView])

        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        self.addSubview(headerStackView)
        self.addSubview(footerStackView)
    }
    
    private func setConstraint() {
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            footerStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            footerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            footerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
