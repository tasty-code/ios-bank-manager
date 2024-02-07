//
//  TimerView.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

final class TimerView: UIView {
    private let timerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "업무시간 - \("00:00:000")"
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(timerLabel)
        self.timerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.timerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.timerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.timerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.timerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
}
