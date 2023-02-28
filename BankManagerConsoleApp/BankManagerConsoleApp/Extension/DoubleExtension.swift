//
//  DoubleExtension.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

extension Double {
    
    func sleep() {
        let usecondsTime = useconds_t(self * 1000000)
        usleep(usecondsTime)
    }
    
}
