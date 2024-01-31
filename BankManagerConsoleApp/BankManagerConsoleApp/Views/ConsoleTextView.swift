import Foundation

struct ConsoleTextView {
    
    func printMessage(input: CustomString, inputTerminator: CustomString? = nil) {
        print(input.description, terminator: inputTerminator?.description ?? "\n")
    }
}
