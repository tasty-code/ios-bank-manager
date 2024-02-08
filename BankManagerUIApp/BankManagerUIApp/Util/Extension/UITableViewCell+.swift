//
//  UITableViewCell+.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/08.
//

import UIKit

extension UITableViewCell {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last ?? ""
    }
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? ""
    }
}
