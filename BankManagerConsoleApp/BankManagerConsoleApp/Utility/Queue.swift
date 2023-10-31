//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by BOMBSGIE on 2023/10/31.
//

import Foundation


struct Queue<T> {
}


extension Queue {
    private class Node {
        var data: T
        var nextNode: Node?
        
        init(data: T) {
            self.data = data
            self.nextNode = nil
        }
    }
}

