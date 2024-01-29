enum Menu {
    case open
    case exit
}

extension Menu {
    var value: Int {
        switch self {
        case .open:
            return 1
        case .exit:
            return 2
        }
    }
}
