//
//  Then.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/07.
//

import UIKit

protocol Then {}

extension Then where Self: AnyObject {
    
    @inlinable
    func then(_ block: (Self) throws -> Void) rethrows -> Self {
      try block(self)
      return self
    }
}

extension NSObject: Then {}
