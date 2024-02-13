enum Menu {
    case open
    case exit
    case wrongInput
    
    init(input: String) {
        switch input {
        case "1":
            self = .open
        case "2":
            self = .exit
        default:
            self = .wrongInput
        }
    }
}
