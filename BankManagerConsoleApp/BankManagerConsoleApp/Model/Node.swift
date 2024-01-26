//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/23/24.
//

import Foundation

final class Node<Element> {
    var data: Element
    var next: Node?
    
    init(data: Element) {
        self.data = data
        print("Node with \(data) has been created.")
    }
    
    deinit {
        print("Node with \(data) has been expired.")
    }
}
