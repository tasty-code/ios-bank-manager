//
//  ListScrollView.swift
//  BankManagerUIApp
//
//  Created by Janine on 11/14/23.
//

import UIKit

final class ListView: UIView {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let itemListStackView: UIStackView = UIStackView(spacing: 16, axis: .vertical)
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            itemListStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            itemListStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0),
            itemListStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            itemListStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        ])
    }
    
    // MARK: - initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView.addSubview(itemListStackView)
        addSubview(scrollView)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListView {
    func addItemToList<UIType: UIView>(_ target: UIType) {
        itemListStackView.addArrangedSubview(target)
    }
    
    func filterLabelItem(_ target: String) -> UILabel? {
        let subViews = itemListStackView.arrangedSubviews
        var filteredItem: UILabel?
        
        for subView in subViews {
            if let view = subView as? UILabel, view.text == target {
                filteredItem = view
            }
        }
        
        return filteredItem
    }
    
    func removeItem<UIType: UIView>(_ target: UIType) {
        itemListStackView.removeArrangedSubview(target)
        target.removeFromSuperview()
    }
    
    func resetAllItem() {
        itemListStackView.arrangedSubviews.forEach {
            itemListStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    func isListEmpty() -> Bool {
        return itemListStackView.arrangedSubviews.count == 0
    }
}
