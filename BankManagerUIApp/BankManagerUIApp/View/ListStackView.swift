//
//  ListStackView.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

final class ListStackView: UIStackView {
    //    func reload(list: [Client]) {
    //        for subview in self.arrangedSubviews {
    //            subview.removeFromSuperview()
    //        }
    //
    //        for client in list {
    //            let label = ListLabel()
    //            label.configure(client: client)
    //            self.addArrangedSubview(label)
    //        }
    //    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 10
        self.alignment = .center
    }
    
    func removeLabel(index: Int) {
        guard index < self.arrangedSubviews.count else { return }
        let label = self.arrangedSubviews[index]
        label.removeFromSuperview()
    }
    
    func addLabel(client: Client) {
        let label = ListLabel(client: client)
        self.addArrangedSubview(label)
    }
}
