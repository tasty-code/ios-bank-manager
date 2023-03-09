//
//  Extension+UIColor.swift
//  BankManagerUIApp
//
//  Created by 송선진 on 2023/03/09.
//

import UIKit

extension UIColor {
    class func designSystem(_ color: Palette) -> UIColor? {
        return UIColor(named: color.rawValue)
    }
}
