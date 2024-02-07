//
//  ViewModel.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/07.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
