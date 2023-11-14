//
//  String.swift
//  BankManagerUIApp
//
//  Created by 김준성 on 11/14/23.
//

import Foundation

extension String {
    func formatTimer() -> TimeInterval? {
        var checkNil = false
        let temp = self.split(separator: "-").map { String($0) }
        let times = temp[1].split(separator: ":").map { time -> Double in
            guard let t = Double(String(time))
            else {
                checkNil = true
                return 0
            }
            
            return t
        }
        
        if checkNil || times.count != 3 {
            return nil
        }
        
        var total = 0.0
        total += times[0] * 60
        total += times[1]
        total += times[2] / 1000
        
        return TimeInterval(total)
    }
}
