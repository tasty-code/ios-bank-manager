import Foundation

struct ConsoleTextView {

}

extension ConsoleTextView {
    func printInputMessage(input: CustomStringInput, inputTerminator: CustomStringInput? = nil) {
        print(input.description, terminator: inputTerminator?.description ?? "\n")
    }
    
    func printMenuMessage(menu: CustomStringPrintMenu, menuTerminator: CustomStringPrintMenu? = nil) {
        print(menu.description, terminator: menuTerminator?.description ?? "\n")
    }
}
