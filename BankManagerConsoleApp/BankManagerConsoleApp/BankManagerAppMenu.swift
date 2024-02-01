//
//  BankManagerAppMenu.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 2/1/24.
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
    
    private init?(number: Int) {
        switch number {
        case Self.open.menuNumebr: self = .open
        case Self.end.menuNumebr: self = .end
        default: return nil
        }
    }
    
    init(input: String) throws {
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard
            trimmedInput.isEmpty == false,
            let number = Int(input),
            let menu = Self.init(number: number)
        else {
            throw IOError.invalidInput
        }
        self = menu
    }
}

extension BankManagerAppMenu: CaseIterable {
    static var allMenusPrompt: String {
        return allCases.enumerated().reduce(into: "") { result, indexAndMenu in
            let adding = "\(indexAndMenu.element.menuNumebr) : \(indexAndMenu.element.description)"
            let terminator = (indexAndMenu.offset + 1 == allCases.count) ? "" : "\n"
            result += adding + terminator
        }
    }
}
