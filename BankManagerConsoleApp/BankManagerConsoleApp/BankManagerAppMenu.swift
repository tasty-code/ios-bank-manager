//
//  BankManagerAppMenu.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/28/24.
//

enum BankManagerAppMenu {
    case open
    case end
    
    private var menuNumebr: Int {
        switch self {
        case .open: return 1
        case .end: return 2
        }
    }
    
    private var description: String {
        switch self {
        case .open: return "은행 개점"
        case .end: return "종료"
        }
    }
    
    init?(number: Int) {
        switch number {
        case Self.open.menuNumebr: self = .open
        case Self.end.menuNumebr: self = .end
        default: return nil
        }
    }
}

extension BankManagerAppMenu: CaseIterable {
    static var allMenusPrompt: String {
        return allCases.enumerated().reduce(into: "") { result, indexAndMenu in
            let adding = "\(indexAndMenu.offset + 1) : \(indexAndMenu.element.description)"
            let terminator = (indexAndMenu.offset + 1 == allCases.count) ? "" : "\n"
            result += adding + terminator
        }
    }
}
