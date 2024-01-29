import Foundation

struct ConsoleTextView {
    
    func printMessage(input: String, inputTerminator: String? = nil) {
        print(input, terminator: inputTerminator ?? "\n")
    }
}
